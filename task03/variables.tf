variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "storageaccount_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnet1_name" {
  description = "Name of the first subnet"
  type        = string
}

variable "subnet2_name" {
  description = "Name of the second subnet"
  type        = string
}

variable "student_email" {
  description = "Student email for tagging"
  type        = string
}