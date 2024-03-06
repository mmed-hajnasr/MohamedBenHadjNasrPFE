locals {
  # resource group
  location = "France Central"

  # current ip
  current_ip = "196.179.197.137/32"

  # different SKUs
  Database_SKU = {
    "dev": "Basic",
    "QA": "Standard",
    "prod": "Standard"
  }
  Web_App_SKU = {
     "dev": "B1",
    "QA": "B2",
    "prod": "B3"
  }

  # vnet Prefixes
  vnet_prefixe                          = "10.0.0.0/16"
  app_service_integration_subnet_prefix = "10.0.1.0/24"
  private_endpoints_subnet_prefix       = "10.0.2.0/24"
  webapp_private_endpoint_ip           = "10.0.2.4"
}
