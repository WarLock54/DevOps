variable "unique_id" {
  type        = string
  description = "Unique identifier for the resources"
}
variable "location" {
  type        = string
  description = "Azure region for the resources"
}
variable "AKS_CLUSTER_NAME" {
  type        = string
  description = "Name of the AKS cluster"
}
variable "rg_name" {
  type        = string
  description = "Resource group name"
}
variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}
variable "subnet_name" {
  type        = string
  description = "Subnet name"
}
variable "aks_loadbalancer_ip" {
  type        = string
  description = "AKS Load Balancer IP address"
}
variable "vnet_address_space" {
  type        = string
  description = "Virtual network address space"
}