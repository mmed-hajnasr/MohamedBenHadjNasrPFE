module "naming" {
  source                 = "Azure/naming/azurerm"
  suffix                 = ["sqlapp-${terraform.workspace}"]
  unique-include-numbers = true
}

resource "azurerm_storage_account" "the_storage_account" {
  name                     = module.naming.storage_account.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.SKU
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "the_container" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.the_storage_account.name
  container_access_type = "private"
}

#* endpoint
resource "azurerm_private_dns_zone" "storage_account_dns_zone" {
  name = "privatelink.storage_account.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name = "dns_link"
  resource_group_name = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.storage_account_dns_zone.name
  virtual_network_id = var.vnet_id
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = module.naming.private_endpoint.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoints_subnet_id

  private_service_connection {
    name                           = "blob"
    private_connection_resource_id = azurerm_storage_account.the_storage_account.id
    is_manual_connection           = false
    subresource_names = ["blob"]
  }

  private_dns_zone_group {
    name = "blob"
    private_dns_zone_ids = [azurerm_private_dns_zone.storage_account_dns_zone.id]
  }
}
