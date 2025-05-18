output "app_service_id" {
  description = "The ID of the App Service"
  value       = azurerm_windows_web_app.this.id
}

output "app_service_name" {
  description = "The name of the App Service"
  value       = azurerm_windows_web_app.this.name
}

output "app_service_default_hostname" {
  description = "The default hostname of the App Service"
  value       = azurerm_windows_web_app.this.default_hostname
}
