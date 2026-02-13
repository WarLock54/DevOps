data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source   = "./modules/keyvault"
  name     = local.keyvault_name
  location = var.location
  rg_name  = azurerm_resource_group.main.name
  sku      = var.keyvault_sku
  tags     = local.common_tags

  tenant_id       = data.azurerm_client_config.current.tenant_id
  current_user_id = data.azurerm_client_config.current.object_id
}

module "storage" {
  source           = "./modules/storage"
  name             = local.sa_name
  location         = var.location
  rg_name          = azurerm_resource_group.main.name
  replication_type = var.sa_replication_type
  container_name   = var.sa_container_name
  tags             = local.common_tags
}

module "aci_redis" {
  source      = "./modules/aci_redis"
  name        = local.redis_aci_name
  location    = var.location
  rg_name     = azurerm_resource_group.main.name
  keyvault_id = module.keyvault.id
  tags        = local.common_tags
  depends_on  = [module.keyvault]
}

module "acr" {
  source          = "./modules/acr"
  name            = local.acr_name
  location        = var.location
  rg_name         = azurerm_resource_group.main.name
  sku             = var.acr_sku
  image_name      = var.image_name
  source_blob_url = module.storage.blob_url
  source_blob_sas = module.storage.sas_token
  tags            = local.common_tags

  git_pat = var.git_pat
}

module "aks" {
  source         = "./modules/aks"
  name           = local.aks_name
  location       = var.location
  rg_name        = azurerm_resource_group.main.name
  node_pool_name = var.aks_node_pool_name
  node_count     = var.aks_node_pool_count
  node_size      = var.aks_node_pool_size
  os_disk_type   = var.aks_node_pool_disk_type
  keyvault_id    = module.keyvault.id
  acr_id         = module.acr.id
  tags           = local.common_tags
}

module "aca" {
  source                = "./modules/aca"
  name                  = local.aca_name
  location              = var.location
  rg_name               = azurerm_resource_group.main.name
  aca_env_name          = local.aca_env_name
  workload_profile_type = var.aca_env_workload_profile_type
  keyvault_id           = module.keyvault.id
  acr_id                = module.acr.id
  acr_login_server      = module.acr.login_server
  image_name            = var.image_name
  kv_redis_host_url     = module.aci_redis.redis_host_secret_id
  kv_redis_password_url = module.aci_redis.redis_password_secret_id
  tags                  = local.common_tags
  depends_on            = [module.acr, module.aci_redis, module.keyvault]
}

module "k8s" {
  source = "./modules/k8s"
  providers = {
    kubectl    = kubectl
    kubernetes = kubernetes
  }
  kv_name                = local.keyvault_name
  tenant_id              = data.azurerm_client_config.current.tenant_id
  aks_identity_client_id = module.aks.aks_identity_client_id
  acr_login_server       = module.acr.login_server
  image_name             = var.image_name
  depends_on             = [module.acr, module.aci_redis, module.aks]
}