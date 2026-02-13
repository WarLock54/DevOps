variable "kv_name" {
  type        = string
  description = "The name of the Azure Key Vault"
}

variable "tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
}

variable "aks_identity_client_id" {
  type        = string
  description = "The Client ID of the AKS managed identity used for KV access"
}

variable "acr_login_server" {
  type        = string
  description = "The login server of the ACR"
}

variable "image_name" {
  type        = string
  description = "The name of the application image"
}