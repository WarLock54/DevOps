variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "A map of resource group objects containing names and locations"
}
variable "app_configs" {
  type = map(object({
    asp_name     = string
    sku          = string
    worker_count = number
    app_name     = string
    rg_key       = string
  }))
  description = "Configuration details for App Service Plans and Windows Web Apps"
}

variable "tm_name" {
  type        = string
  description = "The name of the Traffic Manager profile"
}
variable "verification_ip" {
  type        = string
  description = "The IP address used for endpoint verification"
}
variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources"
}
variable "ip_rule_name" {
  type        = string
  description = "Access restriction allow IP rule name"
}

variable "tm_service_tag_rule_name" {
  type        = string
  description = "Access restriction allow TM service tag rule name"
}

variable "tm_routing_method" {
  type        = string
  description = "Traffic Manager routing method"
}