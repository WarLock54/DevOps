variable "name" {
  description = "Azure Container Instance name"
  type        = string
}

variable "location" {
  description = "Azure region for ACI"
  type        = string
}

variable "rg_name" {
  description = "Resource group name where ACI will be created"
  type        = string
}

variable "image_name" {
  description = "Docker image name"
  type        = string
}

variable "acr_login_server" {
  description = "ACR login server URL"
  type        = string
}

variable "acr_username" {
  description = "ACR admin username"
  type        = string
}

variable "acr_password" {
  description = "ACR admin password"
  type        = string
  sensitive   = true
}

variable "redis_hostname" {
  description = "Redis hostname retrieved from Key Vault"
  type        = string
}

variable "redis_primary_key" {
  description = "Redis primary access key retrieved from Key Vault"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Common tags applied to ACI"
  type        = map(string)
}
