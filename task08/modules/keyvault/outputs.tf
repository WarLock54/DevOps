output "id" {
  description = "Resource ID of the Azure Key Vault"
  value       = azurerm_key_vault.kv.id
}

output "name" {
  description = "Name of the Azure Key Vault"
  value       = azurerm_key_vault.kv.name
}

output "vault_uri" {
  description = "URI endpoint of the Azure Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}
