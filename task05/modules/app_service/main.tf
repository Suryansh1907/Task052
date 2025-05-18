resource "azurerm_windows_web_app" "this" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.app_service_plan_id
  tags                = var.tags

  site_config {
    always_on = true

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        priority    = ip_restriction.value.priority
        ip_address  = try(ip_restriction.value.ip_address, null)
        service_tag = try(ip_restriction.value.service_tag, null)
        action      = "Allow"
      }
    }

    ip_restriction_default_action = "Deny"
  }
}
