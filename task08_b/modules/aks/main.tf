resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.name
  tags                = var.tags

  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.node_count
    vm_size         = var.node_size
    os_disk_type    = "Ephemeral"
    os_disk_size_gb = 50
  }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }
}

resource "azurerm_role_assignment" "aks_acr" {
  scope                            = var.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  principal_type                   = "ServicePrincipal"
  skip_service_principal_aad_check = true # Replikasyon gecikmesini tamamen baypas eder
}

resource "azurerm_key_vault_access_policy" "aks_kv" {
  key_vault_id       = var.keyvault_id
  tenant_id          = azurerm_kubernetes_cluster.aks.identity[0].tenant_id
  object_id          = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].object_id
  secret_permissions = ["Get", "List", "Set", "Delete", "Purge"]
}