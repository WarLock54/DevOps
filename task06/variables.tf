variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed"
}
variable "kv_rg_name" {
  type        = string
  description = "The name of the Key Vault resource group"
}
variable "kv_name" {
  type        = string
  description = "The name of the Key Vault"
}
variable "resources_name_prefix" {
  type        = string
  description = "The prefix for naming resources"
}
variable "sql_admin_username" {
  type        = string
  description = "The username for the SQL admin"
}
variable "sql_admin_secret_name" {
  type        = string
  description = "The name of the SQL admin secret in Key Vault"
}
variable "sql_admin_secret_password" {
  type        = string
  description = "The password for the SQL admin user"
}
variable "sql_sku" {
  type        = string
  description = "The SKU of the SQL server"
}
variable "sql_server_name" {
  type        = string
  description = "The name of the SQL server"
}
variable "sql_db_name" {
  type        = string
  description = "The name of the SQL database"
}
variable "asp_name" {
  type        = string
  description = "The name of the App Service Plan"
}
variable "app_name" {
  type        = string
  description = "The name of the web app"
}
variable "sql_fwr_name" {
  type        = string
  description = "The name of the SQL firewall rule"
}
variable "asp_sku" {
  type        = string
  description = "The SKU of the App Service Plan"
}
variable "app_dotnet_version" {
  type        = string
  description = "The .NET version for the web app"
}
variable "student_email" {
  type        = string
  description = "The email of the student for tagging resources"
}
variable "allowed_ip_address" {
  type        = string
  description = "The allowed IP address for accessing resources"
}