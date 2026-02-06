locals {
  rg_name       = "${var.resources_name_prefix}-rg"
  redis_name    = "${var.resources_name_prefix}-redis"
  keyvault_name = "${var.resources_name_prefix}-kv"

  acr_name = replace("${var.resources_name_prefix}cr", "-", "")

  aks_name = "${var.resources_name_prefix}-aks"

  aci_name = "${var.resources_name_prefix}-ci"

  common_tags = {
    Creator = var.student_email
  }
}