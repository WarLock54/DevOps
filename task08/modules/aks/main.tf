resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.name
  tags                = var.tags

  default_node_pool {
    name         = var.node_pool_name
    node_count   = var.node_pool_count
    vm_size      = var.node_pool_size
    os_disk_type = var.node_pool_disk_type
  }

  identity { type = "SystemAssigned" }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }
}

# ACR'den imaj çekme yetkisi
resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

# Key Vault'tan secret okuma yetkisi (CSI Driver için)
resource "azurerm_key_vault_access_policy" "aks_kv" {
  key_vault_id       = var.kv_id
  tenant_id          = var.tenant_id
  object_id          = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  secret_permissions = ["Get", "List"]
}