variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}
variable "location" {
  type        = string
  description = "The Azure region"
}
variable "vnet_name" {
  type        = string
  description = "The name of the VNet"
}
variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for VNet"
}
variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}
variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefix for subnet"
}
variable "pip_name" {
  type        = string
  description = "Public IP name"
}
variable "dns_label" {
  type        = string
  description = "DNS label for PIP"
}
variable "nsg_name" {
  type        = string
  description = "NSG name"
}
variable "ssh_rule_name" {
  type        = string
  description = "SSH rule name"
}
variable "http_rule_name" {
  type        = string
  description = "HTTP rule name"
}
variable "nic_name" {
  type        = string
  description = "NIC name"
}
variable "ip_config_name" {
  type        = string
  description = "IP config name"
}
variable "ip_allocation_type" {
  type        = string
  description = "IP allocation method"
}
variable "vm_name" {
  type        = string
  description = "VM name"
}
variable "vm_size" {
  type        = string
  description = "VM SKU size"
}
variable "admin_username" {
  type        = string
  description = "Admin user for VM"
}
variable "vm_password" {
  type        = string
  description = "Admin password"
  sensitive   = true
}
variable "tags" {
  type        = map(string)
  description = "Resource tags"
}
variable "protocol_tcp" {
  type        = string
  description = "TCP protocol"
  default     = "Tcp"
}

variable "source_address_all" {
  type        = string
  description = "Source address prefix for all traffic"
  default     = "*"
}