variable "resource_groups" {
  description = "Configuration for resource groups"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "Configuration for App Service Plans"
  type = map(object({
    name         = string
    sku          = string
    worker_count = number
  }))
}

variable "app_services" {
  description = "Configuration for App Services"
  type = map(object({
    name = string
  }))
}

variable "traffic_manager" {
  description = "Configuration for Traffic Manager"
  type = object({
    name           = string
    routing_method = string
  })
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "ip_restrictions" {
  description = "IP restriction rules for App Services"
  type = list(object({
    name        = string
    priority    = number
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}
