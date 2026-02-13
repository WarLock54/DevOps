output "id" {
  value       = azurerm_key_vault.main.id
  description = "Key Vault resource ID"
}

output "name" {
  value       = azurerm_key_vault.main.name
  description = "key vault name"
}

output "vault_uri" {
  value       = azurerm_key_vault.main.vault_uri
  description = "key vault URI"
}