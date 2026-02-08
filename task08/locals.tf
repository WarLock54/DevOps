locals {
  rg_name       = "${var.resources_name_prefix}-rg"    # cmtr-12nxowyz-mod8-rg
  redis_name    = "${var.resources_name_prefix}-redis" # cmtr-12nxowyz-mod8-redis
  keyvault_name = "${var.resources_name_prefix}-kv"    # cmtr-12nxowyz-mod8-kv
  acr_name      = replace("${var.resources_name_prefix}cr", "-", "")
  aks_name      = "${var.resources_name_prefix}-aks" # cmtr-12nxowyz-mod8-aks
  aci_name      = "${var.resources_name_prefix}-ci"  # cmtr-12nxowyz-mod8-ci

  common_tags = {
    Creator = var.student_email
  }
}