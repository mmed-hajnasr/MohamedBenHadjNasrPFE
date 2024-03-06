variable "location" {
  description = "The location/region where the database will be created."
  type        = string
}

variable "SKU" {
  description = "The SKU of the database."
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the database service will be created."
  type        = string
}

variable "private_endpoints_subnet_id" {
  description = "The ID of the subnet where the private endpoint will be created."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network where the database will be created."
  type       = string
}