variable "name" {
  description = "Azure Kubernetes Service cluster name"
  type        = string
}

variable "location" {
  description = "Azure region for AKS"
  type        = string
}

variable "rg_name" {
  description = "Resource group name where AKS will be created"
  type        = string
}

variable "node_pool_name" {
  description = "Default AKS node pool name"
  type        = string
}

variable "node_pool_count" {
  description = "Number of nodes in the default node pool"
  type        = number
}

variable "node_pool_size" {
  description = "VM size for AKS nodes"
  type        = string
}

variable "node_pool_disk_type" {
  description = "OS disk type for AKS nodes"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry ID for AcrPull role assignment"
  type        = string
}

variable "kv_id" {
  description = "Key Vault ID for CSI secrets provider access"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "tags" {
  description = "Common tags applied to AKS"
  type        = map(string)
}
