module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups
  name     = each.value.name
  location = each.value.location
  tags     = var.common_tags
}

module "app_plans" {
  source              = "./modules/app_service_plan"
  for_each            = var.app_configs
  name                = each.value.asp_name
  resource_group_name = module.resource_groups[each.value.rg_key].name
  location            = module.resource_groups[each.value.rg_key].location
  sku_name            = each.value.sku
  worker_count        = each.value.worker_count
  tags                = var.common_tags
}

module "web_apps" {
  source              = "./modules/app_service"
  for_each            = var.app_configs
  name                = each.value.app_name
  resource_group_name = module.resource_groups[each.value.rg_key].name
  location            = module.resource_groups[each.value.rg_key].location
  service_plan_id     = module.app_plans[each.key].id
  tags                = var.common_tags

  ip_restrictions = [
    {
      name       = var.ip_rule_name
      priority   = 100
      ip_address = "${var.verification_ip}/32"
    },
    {
      name        = var.tm_service_tag_rule_name
      priority    = 200
      service_tag = "AzureTrafficManager"
    }
  ]
}

module "traffic_manager" {
  source              = "./modules/traffic_manager"
  name                = var.tm_name
  resource_group_name = module.resource_groups["rg3"].name
  routing_method      = var.tm_routing_method
  tags                = var.common_tags

  endpoints = {
    for k, v in module.web_apps : k => v.id
  }
}