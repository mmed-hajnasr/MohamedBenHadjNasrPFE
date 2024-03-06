output "password" {
  value       = random_password.the_password.result
  description = "The password for the database"
  sensitive   = true
}

output "database_name" {
  value       = azurerm_mssql_database.the_database.name
  description = "The name of the database"
}

output "server_fqdn" {
  value       = azurerm_mssql_server.the_server.fully_qualified_domain_name
  description = "The name of the database server"
}

output "connection_string" {
  value       = "Server=tcp:${azurerm_mssql_server.the_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.the_database.name};Persist Security Info=False;User ID=${azurerm_mssql_server.the_server.administrator_login};Password=${random_password.the_password.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  description = "The connection string to the database"
  sensitive = true
}

output "cli-connection-string" {
  value = "sqlcmd -S ${azurerm_mssql_server.the_server.fully_qualified_domain_name} -U ${azurerm_mssql_server.the_server.administrator_login} -P ${random_password.the_password.result} -d ${azurerm_mssql_database.the_database.name} -I"
  description = "The connection string to the database for use with the SQLCMD CLI"
  sensitive = true
}

output "debuger_ip" {
  value = terraform.workspace == "prod" ? "no vm in prod" : azurerm_public_ip.pip.0.ip_address
  description = "The public IP address of the debugger vm"
}