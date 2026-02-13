variable "name" {
  type        = string
  description = "The name of the Azure Key Vault"
}

variable "location" {
  type        = string
  description = "The Azure region where the Key Vault will be deployed"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "sku" {
  type        = string
  description = "The SKU name of the Key Vault (Standard or Premium)"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
}
variable "tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
}

variable "current_user_id" {
  type        = string
  description = "The Object ID of the current user for access policy"
}