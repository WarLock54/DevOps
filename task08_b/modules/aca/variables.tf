variable "name" {
  type        = string
  description = "The name of the Azure Container App"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "aca_env_name" {
  type        = string
  description = "The name of the Container App Environment"
}

variable "keyvault_id" {
  type        = string
  description = "The ID of the Key Vault for access policy"
}

variable "acr_id" {
  type        = string
  description = "The ID of the ACR for role assignment"
}

variable "acr_login_server" {
  type        = string
  description = "The login server URL of the ACR"
}

variable "kv_redis_host_url" {
  type        = string
  description = "The secret URI from Key Vault for Redis hostname"
}

variable "kv_redis_password_url" {
  type        = string
  description = "The secret URI from Key Vault for Redis password"
}

variable "workload_profile_type" {
  type        = string
  description = "The type of workload profile for ACA environment"
}

variable "image_name" {
  type        = string
  description = "The name of the Docker image to deploy"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to the resources"
}