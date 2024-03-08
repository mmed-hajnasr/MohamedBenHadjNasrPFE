variable "location" {
  description = "The location/region where the storage account is created"
  type        = string
}

variable "SKU" {
    description = "The SKU of the storage account"
    type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network in which to create the private endpoint"
  type        = string
}

variable "private_endpoints_subnet_id" {
  description = "The ID of the subnet in which to create the private endpoint"
  type        = string
}
