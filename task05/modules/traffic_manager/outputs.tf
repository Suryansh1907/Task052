output "traffic_manager_id" {
  description = "The ID of the Traffic Manager Profile"
  value       = azurerm_traffic_manager_profile.this.id
}

output "traffic_manager_fqdn" {
  description = "The FQDN of the Traffic Manager Profile"
  value       = azurerm_traffic_manager_profile.this.fqdn
}
