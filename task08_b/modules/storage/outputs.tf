output "id" {
  value = azurerm_storage_account.sa.id
}

output "blob_url" {
  value = azurerm_storage_blob.app_blob.id
}

output "sas_token" {
  value     = data.azurerm_storage_account_blob_container_sas.sas.sas
  sensitive = true
}