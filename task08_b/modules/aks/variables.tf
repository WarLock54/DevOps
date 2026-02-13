variable "name" {
  type        = string
  description = "The name of the Managed Kubernetes Cluster"
}

variable "location" {
  type        = string
  description = "Azure region for the AKS cluster"
}

variable "rg_name" {
  type        = string
  description = "Resource group name where AKS will be deployed"
}

variable "node_pool_name" {
  type        = string
  description = "The name of the AKS default node pool"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the node pool"
}

variable "node_size" {
  type        = string
  description = "Size of the virtual machines in the node pool"
}

variable "os_disk_type" {
  type        = string
  description = "The type of Disk which should be used for the nodes"
  default     = "Ephemeral"
}

variable "keyvault_id" {
  type        = string
  description = "The ID of the Key Vault for CSI driver access"
}

variable "acr_id" {
  type        = string
  description = "The ID of the ACR for AcrPull role assignment"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for the AKS cluster"
}