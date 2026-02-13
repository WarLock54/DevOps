
resource "azurerm_key_vault" "main" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = var.sku
  tags                        = var.tags
}

# Standalone Access Policy - Task gereği in-line değil, ayrı kaynak olarak tanımlandı
resource "azurerm_key_vault_access_policy" "current_user" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = var.tenant_id       # Değişken kullanıldı
  object_id    = var.current_user_id # Değişken kullanıldı

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge", "Recover", "Restore"
  ]
}