output "rg_id" {
  value       = azurerm_resource_group.rg.id
  description = "Resource Group ID"
}

output "sa_blob_endpoint" {
  value       = azurerm_storage_account.sa.primary_blob_endpoint
  description = "Storage account blob service primary endpoint"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Virtual network ID"
}