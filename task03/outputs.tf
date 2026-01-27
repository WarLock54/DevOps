output "rg_id" {
  value       = azurerm_resource_group.rg.id
  description = "The ID of the Resource Group"
}

output "sa_blob_endpoint" {
  value       = azurerm_storage_account.sa.primary_blob_endpoint
  description = "The primary blob endpoint of the storage account"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network"
}