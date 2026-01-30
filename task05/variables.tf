variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_configs" {
  type = map(object({
    asp_name     = string
    sku          = string
    worker_count = number
    app_name     = string
    rg_key       = string
  }))
}

variable "tm_name" { type = string }
variable "verification_ip" { type = string }
variable "common_tags" { type = map(string) }