variable "traffic_manager_name" {
  description = "The name of the Traffic Manager Profile"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "routing_method" {
  description = "The traffic routing method for the Traffic Manager Profile"
  type        = string
}

variable "endpoints" {
  description = "List of Azure endpoints for the Traffic Manager Profile"
  type = list(object({
    name           = string
    app_service_id = string
    weight         = number
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the Traffic Manager Profile"
  type        = map(string)
  default     = {}
}
