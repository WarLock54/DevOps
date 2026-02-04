output "kube_config" {
  description = "Kubeconfig for accessing the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0]
  sensitive   = true
}

output "name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}
output "kubelet_identity_id" {
  description = "AKS Kubelet Identity Client ID"
  # AKS kümesinin oluşturduğu Managed Identity'nin Client ID'sini dışarı aktarıyoruz
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
}

output "id" {
  value = azurerm_kubernetes_cluster.aks.id
}
