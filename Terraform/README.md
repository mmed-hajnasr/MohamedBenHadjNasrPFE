<!-- BEGIN_TF_DOCS -->
## How to use

the following architecture works differently under 3 workspaces, the first one is the `dev` workspace:

- it has the most basic scaling.
- you need to update the cunnent ip in the local.tf file to be able to access the web app.
- it also has a debugger vm that has a public ip address to be able to access the web app and the database.

the second workspace is the `QA` workspace:

- it has a more advanced scaling similar to production.
- it also has a debugger vm that has a public ip address.
- it has similar restrictions as the prod workspace.

the third workspace is the `prod` workspace:

- it has the most advanced auto-scaling.
- it does not have a debugger vm for security reasons.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.89.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | n/a |
| <a name="module_the_database"></a> [the\_database](#module\_the\_database) | ./modules/database | n/a |
| <a name="module_the_web_app"></a> [the\_web\_app](#module\_the\_web\_app) | ./modules/service_app | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.app_service_integration_NSG](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.private_endpoints_NSG](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.the_group](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.app_service_integration_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/subnet) | resource |
| [azurerm_subnet.private_endpoints_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.connect_app_service_to_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.private_endpoints_to_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.the_network](https://registry.terraform.io/providers/hashicorp/azurerm/3.89.0/docs/resources/virtual_network) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The connection string to the database |
| <a name="output_debbuger_ip"></a> [debbuger\_ip](#output\_debbuger\_ip) | The public IP address of the debugger vm |
<!-- END_TF_DOCS -->