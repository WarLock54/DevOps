variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "nic_name" {
  type        = string
  description = "The name of the network interface"
}

variable "nsg_name" {
  type        = string
  description = "The name of the network security group"
}

variable "http_rule_name" {
  type        = string
  description = "The name of the HTTP NSG rule"
}

variable "ssh_rule_name" {
  type        = string
  description = "The name of the SSH NSG rule"
}

variable "pip_name" {
  type        = string
  description = "The name of the public IP"
}

variable "dns_label" {
  type        = string
  description = "The DNS label for the public IP"
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "creator_tag" {
  type        = string
  description = "The email of the creator for tagging"
}

variable "vm_password" {
  type        = string
  description = "The admin password for the VM"
  sensitive   = true
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default = {
    Creator = "onur_atalik@epam.com"
  }
}