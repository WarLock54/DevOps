variable "name" {
  type        = string
  description = "The name of the Azure Container Instance for Redis"
}

variable "location" {
  type        = string
  description = "Azure region for ACI"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "keyvault_id" {
  type        = string
  description = "The ID of the Key Vault to store Redis secrets"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for the ACI resource"
}