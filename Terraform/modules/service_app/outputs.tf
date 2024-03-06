output "app_url" {
  value = azurerm_linux_web_app.the_app.default_hostname
  description = "The URL of the app service"
}