variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for the App Service Plan"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan"
  type        = string
}

variable "worker_count" {
  description = "The number of workers (instances) for the App Service Plan"
  type        = number
}

variable "tags" {
  description = "Tags to apply to the App Service Plan"
  type        = map(string)
  default     = {}
}
