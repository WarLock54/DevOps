variable "resources_name_prefix" {
  type        = string
  description = "Prefix used for naming all resources"
}

variable "student_email" {
  type        = string
  description = "Email of the student, used for the 'Creator' tag"
}

variable "location" {
  type        = string
  default     = "francecentral"
  description = "The Azure region where resources will be created"
}

variable "sa_replication_type" {
  type        = string
  description = "Storage account replication type (e.g., LRS, GRS)"
}

variable "sa_container_name" {
  type        = string
  description = "Name of the storage container for the application archive"
}

variable "keyvault_sku" {
  type        = string
  description = "The SKU of the Azure Key Vault (Standard or Premium)"
}

variable "acr_sku" {
  type        = string
  description = "The SKU of the Azure Container Registry"
}

variable "image_name" {
  type        = string
  description = "The name of the Docker image to be built and pushed"
}

variable "aca_env_workload_profile_type" {
  type        = string
  description = "The workload profile type for ACA Environment"
}

variable "aks_node_pool_name" {
  type        = string
  description = "The name of the default AKS node pool"
}

variable "aks_node_pool_count" {
  type        = number
  description = "The number of nodes in the AKS node pool"
}

variable "aks_node_pool_size" {
  type        = string
  description = "The VM size for the AKS nodes"
}

variable "aks_node_pool_disk_type" {
  type        = string
  description = "The OS disk type for AKS nodes"
}
variable "redis_aci_sku" {
  type        = string
  description = "The SKU for the Redis instance in Azure Container Instances"
}
variable "git_pat" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
  default     = "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"
}