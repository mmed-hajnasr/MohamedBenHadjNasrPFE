resource "azurerm_resource_group" "the_group" {
  name     = module.naming.resource_group.name
  location = local.location
}

module "the_web_app" {
  source              = "./modules/service_app"
  location            = local.location
  resource_group_name = azurerm_resource_group.the_group.name
  vnet_id             = azurerm_virtual_network.the_network.id
  SKU                 = local.Web_App_SKU[terraform.workspace]
  Vnet_integration_subnet_id  = azurerm_subnet.app_service_integration_subnet.id
  connection_string = module.the_database.connection_string
  allowed_ip = local.current_ip
}

module "the_database" {
  source              = "./modules/database"
  location            = local.location
  resource_group_name = azurerm_resource_group.the_group.name
  SKU                 = local.Database_SKU[terraform.workspace]
  username            = "mmed"
  vnet_id = azurerm_virtual_network.the_network.id
  private_endpoints_subnet_id = azurerm_subnet.private_endpoints_subnet.id
}

# module "storage_account" {
#   source                 = "./modules/storage_account"
#   location               = local.location
#   resource_group_name    = azurerm_resource_group.the_group.name
#   SKU                    = "Standard"
#   vnet_id                = azurerm_virtual_network.the_network.id
#   private_endpoints_subnet_id = azurerm_subnet.private_endpoints_subnet.id
# }