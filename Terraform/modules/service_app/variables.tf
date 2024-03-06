variable "location" {
  description = "The location/region where the app service will be created."
  type        = string
}

variable "SKU" {
  description = "The SKU of the app service plan."
  type        = string
}

variable "Vnet_integration_subnet_id" {
  description = "The ID of the subnet in which the app service will be integrated."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the app service will be created."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network in which the app service will be integrated."
  type        = string
}

variable "connection_string" {
  description = "The connection string to the database."
  type        = string
}

variable "allowed_ip" {
  description = "The IP address that will be allowed to access the app service."
  type        = string
}