output "load_balancer_ip" {
  value       = data.kubernetes_service.app_service.status.0.load_balancer.0.ingress.0.ip
  description = "Load Balancer IP address of APP in AKS"
}