data "archive_file" "app" {
  type        = "tar.gz"
  source_dir  = "${path.root}/application"
  output_path = "${path.root}/app.tar.gz"
}

resource "time_static" "start" {}
resource "time_offset" "expiry" {
  offset_days = 7
}

resource "azurerm_storage_account" "sa" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.replication_type
  tags                     = var.tags
}

resource "azurerm_storage_container" "sc" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "app_blob" {
  name                   = "app.tar.gz"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.sc.name
  type                   = "Block"
  source                 = data.archive_file.app.output_path
}

data "azurerm_storage_account_blob_container_sas" "sas" {
  connection_string = azurerm_storage_account.sa.primary_connection_string
  container_name    = azurerm_storage_container.sc.name

  start  = time_static.start.rfc3339
  expiry = time_offset.expiry.rfc3339

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }
}