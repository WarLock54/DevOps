variable "name" {
  type        = string
  description = "The name of the Storage Account (alphanumeric only)"
}

variable "location" {
  type        = string
  description = "Azure region for the Storage Account"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "replication_type" {
  type        = string
  description = "Storage account replication type (LRS, GRS etc.)"
}

variable "container_name" {
  type        = string
  description = "Name of the blob container"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the storage account"
}