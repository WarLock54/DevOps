output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}

output "client_certificate" {
  value = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
}

output "client_key" {
  value = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
}

output "cluster_ca_certificate" {
  value = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
}

output "aks_identity_client_id" {
  value = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].client_id
}