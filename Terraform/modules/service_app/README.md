<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_virtual_network_swift_connection.vnet_integration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_linux_web_app.the_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_service_plan.the_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SKU"></a> [SKU](#input\_SKU) | The SKU of the app service plan. | `string` | n/a | yes |
| <a name="input_Vnet_integration_subnet_id"></a> [Vnet\_integration\_subnet\_id](#input\_Vnet\_integration\_subnet\_id) | The ID of the subnet in which the app service will be integrated. | `string` | n/a | yes |
| <a name="input_allowed_ip"></a> [allowed\_ip](#input\_allowed\_ip) | The IP address that will be allowed to access the app service. | `string` | n/a | yes |
| <a name="input_connection_string"></a> [connection\_string](#input\_connection\_string) | The connection string to the database. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the app service will be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the app service will be created. | `string` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | The ID of the virtual network in which the app service will be integrated. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_url"></a> [app\_url](#output\_app\_url) | The URL of the app service |
<!-- END_TF_DOCS -->