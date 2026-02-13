output "redis_host_secret_id" {
  value       = azurerm_key_vault_secret.redis_host.id
  description = "Key Vault Secret ID for Redis Hostname"
}

output "redis_password_secret_id" {
  value       = azurerm_key_vault_secret.redis_pwd.id
  description = "Key Vault Secret ID for Redis Password"
}

output "redis_fqdn" {
  value = azurerm_container_group.redis.fqdn
}