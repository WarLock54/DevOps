variable "name" {
  type        = string
  description = "Redis instance name"
}
variable "location" {
  type        = string
  description = "Azure region"
}
variable "rg_name" {
  type        = string
  description = "Resource group name"
}
variable "capacity" {
  type        = number
  description = "Redis capacity"
}
variable "sku_family" {
  type        = string
  description = "Redis SKU family"
}
variable "sku" {
  type        = string
  description = "Redis SKU name"
}
variable "kv_id" {
  type        = string
  description = "Key Vault ID to store secrets"
}
variable "secret_name_hostname" {
  type        = string
  description = "Secret name for hostname"
}
variable "secret_name_key" {
  type        = string
  description = "Secret name for primary key"
}
variable "tags" {
  type        = map(string)
  description = "Common tags"
}
variable "policy_dependency" {
  type        = any
  default     = null
  description = "policy dependency"
}