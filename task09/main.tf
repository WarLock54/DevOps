module "azure_firewall" {
  source = "./modules/afw"

  unique_id   = var.unique_id
  location    = var.location
  rg_name     = var.rg_name
  vnet_name   = var.vnet_name
  subnet_name = var.subnet_name
  aks_lb_ip   = var.aks_loadbalancer_ip
  # Naming from root locals
  afw_name  = local.afw_name
  pip_name  = local.pip_name
  rt_name   = local.rt_name
  snet_name = local.snet_name
}