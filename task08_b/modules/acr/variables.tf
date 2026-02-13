variable "name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "location" {
  type        = string
  description = "Location of the ACR"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "sku" {
  type        = string
  description = "The SKU of the ACR (Basic, Standard, Premium)"
}

variable "image_name" {
  type        = string
  description = "Target Docker image name"
}

variable "source_blob_url" {
  type        = string
  description = "The URL of the source code archive blob"
}

variable "source_blob_sas" {
  type        = string
  description = "The SAS token to access the source blob"
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags"
}
variable "git_pat" {
  type        = string
  description = "pat"
}