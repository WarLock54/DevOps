output "host" {
  description = "AKS kümesinin API server adresi."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "client_certificate" {
  description = "AKS kümesine bağlanmak için kullanılan istemci sertifikası."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "client_key" {
  description = "AKS kümesine bağlanmak için kullanılan istemci anahtarı."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
}

output "cluster_ca_certificate" {
  description = "AKS kümesi CA sertifikası."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
}

output "kubelet_identity_id" {
  description = "Key Vault erişimi için kullanılan AKS Kubelet Managed Identity Client ID."
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
}

output "id" {
  description = "AKS kümesinin Azure kaynak ID'si."
  value       = azurerm_kubernetes_cluster.aks.id
}