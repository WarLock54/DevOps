variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "routing_method" { type = string }
variable "tags" { type = map(string) }
variable "endpoints" { type = map(string) }