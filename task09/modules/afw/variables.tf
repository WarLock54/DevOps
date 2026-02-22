variable "unique_id" {
  type        = string
  description = "Unique identifier for the resources"
}
variable "location" {
  type        = string
  description = "Azure region for the resources"
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
variable "aks_lb_ip" {
  type        = string
  description = "AKS Load Balancer IP address"
}
variable "afw_name" {
  type        = string
  description = "Azure Firewall name"
}
variable "pip_name" {
  type        = string
  description = "Public IP name for Azure Firewall"
}
variable "rt_name" {
  type        = string
  description = "Route Table name for Azure Firewall"
}
variable "snet_name" {
  type        = string
  description = "Subnet name for Azure Firewall (must be 'AzureFirewallSubnet')"
}
variable "AKS_CLUSTER_NAME" {
  type        = string
  description = "Name of the AKS cluster"
}