resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.password.result
  tags                         = var.tags
}

resource "azurerm_mssql_database" "db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.sql_sku
  tags      = var.tags
}

resource "azurerm_mssql_firewall_rule" "azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "verification_agent" {
  name             = var.sql_fwr_name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_key_vault_secret" "sql_user" {
  name         = var.sql_admin_secret_name
  value        = var.sql_admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "sql_pass" {
  name         = var.sql_admin_secret_password
  value        = random_password.password.result
  key_vault_id = var.key_vault_id
}