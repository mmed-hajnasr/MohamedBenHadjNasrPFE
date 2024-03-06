output "connection_string" {
  value       = module.the_database.cli-connection-string
  description = "The connection string to the database"
  sensitive = true
}
output "debbuger_ip" {
  value       = module.the_database.debuger_ip
  description = "The public IP address of the debugger vm"
}