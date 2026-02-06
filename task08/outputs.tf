output "aci_fqdn" {
  description = "Azure Container Instance uygulamasının tam nitelikli alan adı (FQDN)."
  value       = module.aci.fqdn
}

data "kubernetes_service" "app" {
  metadata {
    name = "redis-flask-app-service"
  }
  depends_on = [kubectl_manifest.service]
}

output "aks_lb_ip" {
  description = "AKS üzerinde çalışan uygulamanın dış dünyaya açık Public IP adresi."
  value       = data.kubernetes_service.app.status[0].load_balancer[0].ingress[0].ip
}