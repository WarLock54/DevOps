# 1. Önce Secret Provider Class (Deployment buna bağımlı)
resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.root}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = var.aks_identity_client_id
    kv_name                    = var.kv_name
    redis_url_secret_name      = "redis-hostname"
    redis_password_secret_name = "redis-password"
    tenant_id                  = var.tenant_id
  })
}

# 2. Deployment
resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.root}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = var.acr_login_server
    app_image_name   = var.image_name
    image_tag        = "latest"
  })

  /*wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }*/
  depends_on = [kubectl_manifest.secret_provider]
}

# 3. Service
resource "kubectl_manifest" "service" {
  yaml_body = file("${path.root}/k8s-manifests/service.yaml")

 /* wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }*/
}

# 4. Data Source
data "kubernetes_service" "app_service" {
  metadata {
    name = "redis-flask-app-service"
  }
  depends_on = [kubectl_manifest.service]
}