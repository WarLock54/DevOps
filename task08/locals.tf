locals {

  rg_name       = var.resource_group_name
  redis_name    = var.redis_name
  keyvault_name = var.keyvault_name
  acr_name      = var.acr_name
  aks_name      = var.aks_name
  aci_name      = var.aci_name

  # Etiketleme yönetimi
  common_tags = {
    Creator = var.student_email
  }
}