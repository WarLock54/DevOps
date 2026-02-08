# 1. Mevcut Resource Group'u Azure'dan çekiyoruz
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

# 2. Tenant ve Object ID çekmek için config
data "azurerm_client_config" "current" {}

module "keyvault" {
  source          = "./modules/keyvault"
  name            = var.keyvault_name
  rg_name         = data.azurerm_resource_group.main.name
  location        = data.azurerm_resource_group.main.location
  sku             = var.keyvault_sku
  tenant_id       = data.azurerm_client_config.current.tenant_id
  current_user_id = data.azurerm_client_config.current.object_id
  tags            = local.common_tags
}

module "redis" {
  source               = "./modules/redis"
  name                 = var.redis_name
  rg_name              = data.azurerm_resource_group.main.name
  location             = data.azurerm_resource_group.main.location
  capacity             = var.redis_capacity
  sku_family           = var.redis_sku_family
  sku                  = var.redis_sku
  kv_id                = module.keyvault.id
  secret_name_hostname = var.redis_hostname
  secret_name_key      = var.redis_primary_key
  tags                 = local.common_tags
}

module "acr" {
  source     = "./modules/acr"
  name       = var.acr_name
  rg_name    = data.azurerm_resource_group.main.name
  location   = data.azurerm_resource_group.main.location
  sku        = var.acr_sku
  image_name = var.image_name
  git_pat    = var.git_pat
  tags       = local.common_tags
}

module "aks" {
  source              = "./modules/aks"
  name                = var.aks_name
  rg_name             = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  node_pool_name      = var.aks_node_pool_name
  node_pool_count     = var.aks_node_pool_count
  node_pool_size      = var.aks_node_pool_size
  node_pool_disk_type = var.aks_node_pool_disk_type
  acr_id              = module.acr.id
  kv_id               = module.keyvault.id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = local.common_tags
}

module "aci" {
  source            = "./modules/aci"
  name              = var.aci_name
  rg_name           = data.azurerm_resource_group.main.name
  location          = data.azurerm_resource_group.main.location
  acr_login_server  = module.acr.login_server
  acr_username      = module.acr.admin_username
  acr_password      = module.acr.admin_password
  image_name        = var.image_name
  redis_hostname    = module.redis.hostname
  redis_primary_key = module.redis.primary_key
  tags              = local.common_tags
  depends_on        = [module.acr, module.redis]
}

# --- Kubernetes Manifestleri ---

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.kubelet_identity_id
    kv_name                    = module.keyvault.name
    redis_url_secret_name      = var.redis_hostname
    redis_password_secret_name = var.redis_primary_key
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })
  depends_on = [module.aks, module.redis]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = var.image_name
    image_tag        = "latest"
  })
  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }
  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")
  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }
  depends_on = [kubectl_manifest.deployment]
}