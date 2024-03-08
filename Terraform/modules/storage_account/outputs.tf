output "storage_account_fqdn" {
  description = "The FQDN of the storage account"
  value       = azurerm_storage_account.the_storage_account.primary_blob_endpoint
}