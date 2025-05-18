variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for the App Service"
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  type        = string
}

variable "ip_restrictions" {
  description = "List of IP restriction rules for the App Service"
  type = list(object({
    name        = string
    priority    = number
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the App Service"
  type        = map(string)
  default     = {}
}
