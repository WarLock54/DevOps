variable "resource_group_name" {
  type        = string
  description = "RG Name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "vnet_name" {
  type        = string
  description = "VNet Name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "VNet CIDR"
}

variable "subnet_name" {
  type        = string
  description = "Subnet Name"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Subnet CIDR"
}

variable "pip_name" {
  type        = string
  description = "Public IP Name"
}

variable "dns_label" {
  type        = string
  description = "DNS Label"
}

variable "nsg_name" {
  type        = string
  description = "NSG Name"
}

variable "ssh_rule_name" {
  type        = string
  description = "SSH Rule Name"
}

variable "http_rule_name" {
  type        = string
  description = "HTTP Rule Name"
}

variable "nic_name" {
  type        = string
  description = "NIC Name"
}

variable "ip_config_name" {
  type        = string
  description = "IP Config Name"
}

variable "ip_allocation_type" {
  type        = string
  description = "Dynamic/Static"
}

variable "vm_name" {
  type        = string
  description = "VM Name"
}

variable "vm_size" {
  type        = string
  description = "VM Size SKU"
}

variable "admin_username" {
  type        = string
  description = "Admin User"
}

variable "vm_password" {
  type        = string
  description = "Admin Password"
  sensitive   = true
}

variable "protocol_tcp" {
  type        = string
  description = "TCP Protocol"
}

variable "source_address_all" {
  type        = string
  description = "Any IP (*)"
}

variable "tags" {
  type        = map(string)
  description = "Resource Tags"
}