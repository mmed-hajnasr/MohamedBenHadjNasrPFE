module "naming" {
  source  = "Azure/naming/azurerm"
  suffix = ["sqlapp-${terraform.workspace}"]
  unique-include-numbers = true
}

resource "random_password" "the_password" {
  length           = 16
}

resource "azurerm_mssql_server" "the_server" {
  name                         = module.naming.mssql_server.name_unique
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = random_password.the_password.result
  public_network_access_enabled = false
  outbound_network_restriction_enabled = true
}

resource "azurerm_mssql_database" "the_database" {
  name           = module.naming.mssql_database.name
  server_id      = azurerm_mssql_server.the_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  sku_name       = var.SKU
}

resource "azurerm_private_dns_zone" "database_dns_zone" {
  name = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name = "dns_link"
  resource_group_name = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.database_dns_zone.name
  virtual_network_id = var.vnet_id
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = module.naming.private_endpoint.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoints_subnet_id

  private_service_connection {
    name                           = "sql"
    private_connection_resource_id = azurerm_mssql_server.the_server.id
    is_manual_connection           = false
    subresource_names = ["sqlServer"]
  }

  private_dns_zone_group {
    name = "sql"
    private_dns_zone_ids = [azurerm_private_dns_zone.database_dns_zone.id]
  }
}


# debugger
resource "azurerm_public_ip" "pip" {
  count = terraform.workspace == "prod" ? 0 : 1
  name = "example-pip"
  location = var.location
  allocation_method = "Dynamic"
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "example" {
  count = terraform.workspace == "prod" ? 0 : 1
  name                = "example-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.private_endpoints_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip[0].id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  count = terraform.workspace == "prod" ? 0 : 1
  name                = module.naming.linux_virtual_machine.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "mmed"
  network_interface_ids = [
    azurerm_network_interface.example[0].id,
  ]

  admin_ssh_key {
    username   = "mmed"
    public_key = file("~/.ssh/debugger.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}