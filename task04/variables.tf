variable "resource_group_name" { default = "cmaz-12nxowyz-mod4-rg" }
variable "vnet_name" { default = "cmaz-12nxowyz-mod4-vnet" }
variable "subnet_name" { default = "frontend" }
variable "nic_name" { default = "cmaz-12nxowyz-mod4-nic" }
variable "nsg_name" { default = "cmaz-12nxowyz-mod4-nsg" }
variable "pip_name" { default = "cmaz-12nxowyz-mod4-pip" }
variable "vm_name" { default = "cmaz-12nxowyz-mod4-vm" }
variable "dns_label" { default = "cmaz-12nxowyz-mod4-nginx" }

variable "vm_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
  default = {
    Creator = "onur_atalik@epam.com"
  }
}