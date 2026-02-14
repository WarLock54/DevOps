# 1. Secret Provider Class - Key Vault entegrasyonu için zorunludur
resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.root}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = var.aks_identity_client_id
    kv_name                    = var.kv_name
    redis_url_secret_name      = "redishostname"
    redis_password_secret_name = "redisprimarykey"
    tenant_id                  = var.tenant_id
  })
}

# 2. Deployment - Uygulamanın AKS üzerinde ayağa kaldırılması
resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.root}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = var.acr_login_server
    app_image_name   = var.image_name
    image_tag        = "latest"
  })

  # Task Gereksinimi: En az 1 replica hazır olana kadar bekle
  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider]
}

# 3. Service - Uygulamayı dış dünyaya açan servis manifesti
resource "kubectl_manifest" "service" {
  yaml_body = file("${path.root}/k8s-manifests/service.yaml")

  # Task Gereksinimi: Load Balancer IP adresi atanana kadar bekle
  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [kubectl_manifest.deployment]
}

# 4. Data Source - Atanan Load Balancer IP'sini çekmek için kubernetes provider kullanımı
data "kubernetes_service" "app_service" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  # IP adresinin atanmış olduğundan emin olmak için servisin tamamlanmasını bekler
  depends_on = [kubectl_manifest.service]
}