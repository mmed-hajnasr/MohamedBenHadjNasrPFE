#* Network
resource "azurerm_virtual_network" "the_network" {
  name                = module.naming.virtual_network.name
  location            = local.location
  resource_group_name = azurerm_resource_group.the_group.name
  address_space       = [local.vnet_prefixe]
  dns_servers         = ["168.63.129.16"]

  tags = {
    environment = "${terraform.workspace}"
  }
}
#* Subnets

resource "azurerm_subnet" "app_service_integration_subnet" {
  name                 = "app_service_integration_subnet"
  resource_group_name  = azurerm_resource_group.the_group.name
  virtual_network_name = azurerm_virtual_network.the_network.name
  address_prefixes     = [local.app_service_integration_subnet_prefix]
  delegation {
    name = "webapp"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "private_endpoints_subnet" {
  name                 = "private_endpoints_subnet"
  resource_group_name  = azurerm_resource_group.the_group.name
  virtual_network_name = azurerm_virtual_network.the_network.name
  address_prefixes     = [local.private_endpoints_subnet_prefix]
  service_endpoints    = ["Microsoft.Web"]
}

resource "azurerm_network_security_group" "app_service_integration_NSG" {
  name                = "app_service_integration_NSG"
  location            = local.location
  resource_group_name = azurerm_resource_group.the_group.name
  security_rule {
    name                       = "Allow-OUT-private-endpoints"
    priority                   = 109
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = local.private_endpoints_subnet_prefix
  }
}
resource "azurerm_subnet_network_security_group_association" "connect_app_service_to_nsg" {
  subnet_id                 = azurerm_subnet.app_service_integration_subnet.id
  network_security_group_id = azurerm_network_security_group.app_service_integration_NSG.id
}

resource "azurerm_network_security_group" "private_endpoints_NSG" {
  name                = "private_endpoints_NSG"
  location            = local.location
  resource_group_name = azurerm_resource_group.the_group.name
  security_rule {
    name                       = "Deny-OUT"
    priority                   = 110
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "private_endpoints_to_nsg" {
  subnet_id                 = azurerm_subnet.private_endpoints_subnet.id
  network_security_group_id = azurerm_network_security_group.private_endpoints_NSG.id
}


