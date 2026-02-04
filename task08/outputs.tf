output "aci_fqdn" {
  value = module.aci.fqdn
}

data "kubernetes_service" "app" {
  metadata {
    name = "redis-flask-app-service"
  }
  depends_on = [kubectl_manifest.service]
}

output "aks_lb_ip" {
  value = data.kubernetes_service.app.status[0].load_balancer[0].ingress[0].ip
}