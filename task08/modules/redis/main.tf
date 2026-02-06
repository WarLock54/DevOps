# modules/redis/main.tf içeriği SADECE bu olmalı:

resource "azurerm_redis_cache" "redis" {
  name                 = var.name
  location             = var.location
  resource_group_name  = var.rg_name
  capacity             = var.capacity
  family               = var.sku_family
  sku_name             = var.sku
  non_ssl_port_enabled = false
  minimum_tls_version  = "1.2"
  tags                 = var.tags
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.secret_name_hostname
  value        = azurerm_redis_cache.redis.hostname
  key_vault_id = var.kv_id
}

resource "azurerm_key_vault_secret" "redis_key" {
  name         = var.secret_name_key
  value        = azurerm_redis_cache.redis.primary_access_key
  key_vault_id = var.kv_id
}