locals {
  name_prefix = var.resources_name_prefix

  # Task parametrelerine tam uyum için isimlendirme kuralları
  rg_name        = "${local.name_prefix}-rg"
  redis_aci_name = "${local.name_prefix}-redis-ci"
  sa_name        = "${replace(local.name_prefix, "-", "")}sa"
  keyvault_name  = "${local.name_prefix}-kv"
  acr_name       = "${replace(local.name_prefix, "-", "")}cr"
  aca_env_name   = "${local.name_prefix}-cae"
  aca_name       = "${local.name_prefix}-ca"
  aks_name       = "${local.name_prefix}-aks"

  common_tags = {
    Creator = "onur_atalik@epam.com"
  }
}