module "naming" {
  source                 = "Azure/naming/azurerm"
  suffix                 = ["sqlapp-${terraform.workspace}"]
  unique-include-numbers = true
}

resource "azurerm_service_plan" "the_plan" {
  name                = module.naming.app_service_plan.name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.SKU
}

resource "azurerm_linux_web_app" "the_app" {
  name                          = module.naming.app_service.name_unique
  resource_group_name           = var.resource_group_name
  location                      = var.location
  service_plan_id               = azurerm_service_plan.the_plan.id

  site_config {
    ip_restriction {
      priority = 100
      ip_address  = terraform.workspace == "dev" ? var.allowed_ip : "0.0.0.0/0"
      action      = "Allow"
    }
    ip_restriction {
      priority = 1001
      ip_address  = "0.0.0.0/0"
      action      = "Deny"
    }
    application_stack {
      dotnet_version = "6.0"
    }
  }

  connection_string {
    name  = "Database"
    type  = "SQLAzure"
    value = var.connection_string
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_linux_web_app.the_app.id
  subnet_id      = var.Vnet_integration_subnet_id
}
