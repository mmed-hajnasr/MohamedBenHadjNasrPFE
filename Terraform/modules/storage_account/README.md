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
| [azurerm_private_dns_zone.storage_account_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_storage_account.the_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.the_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SKU"></a> [SKU](#input\_SKU) | The SKU of the storage account | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the storage account is created | `string` | n/a | yes |
| <a name="input_private_endpoints_subnet_id"></a> [private\_endpoints\_subnet\_id](#input\_private\_endpoints\_subnet\_id) | The ID of the subnet in which to create the private endpoint | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account | `string` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | The ID of the virtual network in which to create the private endpoint | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_fqdn"></a> [storage\_account\_fqdn](#output\_storage\_account\_fqdn) | The FQDN of the storage account |
<!-- END_TF_DOCS -->