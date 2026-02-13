resource "random_password" "redis" {
  length  = 16
  special = true
}

resource "azurerm_container_group" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  ip_address_type     = "Public"
  dns_name_label      = var.name
  os_type             = "Linux"
  tags                = var.tags

  container {
    name   = "redis"
    image  = "mcr.microsoft.com/oss/bitnami/redis:7.0"
    cpu    = "1.0"
    memory = "1.5"

    ports {
      port     = 6379
      protocol = "TCP"
    }

    commands = [
      "redis-server", 
      "--protected-mode", "no", 
      "--requirepass", random_password.redis.result
    ]
  }
}

resource "azurerm_key_vault_secret" "redis_pwd" {
  name         = "redis-password"
  value        = random_password.redis.result
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "redis_host" {
  name         = "redis-hostname"
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.keyvault_id
}