locals {
  suffix        = random_string.suffix.result
  rg_name       = var.resource_group_name
  redis_name    = "${var.redis_name}-${local.suffix}"
  keyvault_name = substr("kv-${var.keyvault_name}-${local.suffix}", 0, 24)
  acr_name      = replace("acr${var.acr_name}${local.suffix}", "-", "")
  aks_name      = "${var.aks_name}-${local.suffix}"
  aci_name      = "${var.aci_name}-${local.suffix}"

  # Etiketleme yönetimi
  common_tags = {
    Creator = var.student_email
  }
}