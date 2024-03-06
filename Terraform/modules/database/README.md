<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_mssql_database.the_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.the_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_network_interface.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_private_dns_zone.database_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [random_password.the_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SKU"></a> [SKU](#input\_SKU) | The SKU of the database. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the database will be created. | `string` | n/a | yes |
| <a name="input_private_endpoints_subnet_id"></a> [private\_endpoints\_subnet\_id](#input\_private\_endpoints\_subnet\_id) | The ID of the subnet where the private endpoint will be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the database service will be created. | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | The username for the database | `string` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | The ID of the virtual network where the database will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cli-connection-string"></a> [cli-connection-string](#output\_cli-connection-string) | The connection string to the database for use with the SQLCMD CLI |
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The connection string to the database |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | The name of the database |
| <a name="output_debuger_ip"></a> [debuger\_ip](#output\_debuger\_ip) | The public IP address of the debugger vm |
| <a name="output_password"></a> [password](#output\_password) | The password for the database |
| <a name="output_server_fqdn"></a> [server\_fqdn](#output\_server\_fqdn) | The name of the database server |
<!-- END_TF_DOCS -->