resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.traffic_manager_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method
  tags                   = var.tags

  dns_config {
    relative_name = var.traffic_manager_name
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTPS"
    port     = 443
    path     = "/"
  }
}

resource "azurerm_traffic_manager_azure_endpoint" "this" {
  for_each = { for idx, endpoint in var.endpoints : endpoint.name => endpoint }

  name               = each.value.name
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = each.value.app_service_id
  weight             = each.value.weight
  enabled            = true
}
