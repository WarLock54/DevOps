variable "name" {
  description = "Azure Key Vault name"
  type        = string
}

variable "location" {
  description = "Azure region where Key Vault will be created"
  type        = string
}

variable "rg_name" {
  description = "Resource group name where Key Vault will be created"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID"
  type        = string
}

variable "sku" {
  description = "Key Vault SKU name (standard or premium)"
  type        = string
}

variable "current_user_id" {
  description = "Object ID of the current user for full Key Vault secret access"
  type        = string
}

variable "tags" {
  description = "Common tags applied to the Key Vault"
  type        = map(string)
}
