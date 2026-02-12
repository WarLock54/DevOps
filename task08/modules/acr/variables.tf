variable "name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "rg_name" {
  description = "Resource group name where ACR will be created"
  type        = string
}

variable "location" {
  description = "Azure region for ACR"
  type        = string
}

variable "sku" {
  description = "SKU of the Azure Container Registry"
  type        = string
  default     = "Standard"
}

variable "image_name" {
  description = "Docker image name to be built and pushed"
  type        = string
}

variable "git_pat" {
  description = "Git Personal Access Token for ACR Task source authentication"
  type        = string
  sensitive   = true
}
variable "enable_acr_task" {
  type        = bool
  default     = false
  description = "Abonelik kısıtlaması nedeniyle Task oluşumunu kontrol eder."
}
variable "tags" {
  description = "Common tags applied to ACR"
  type        = map(string)
}