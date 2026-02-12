resources_name_prefix = "cmtr-12nxowyz-mod8" # Prefix olarak bunu kullanacağız
student_email         = "onur_atalik@epam.com"
# Redis
redis_capacity    = 2
redis_sku         = "Basic"
redis_sku_family  = "C"
redis_hostname    = "redis-hostname"
redis_primary_key = "redis-primary-key"

# Key Vault
keyvault_sku  = "standard"
keyvault_name = "cmtr-12nxowyz-mod8-kv"
# ACR
acr_sku    = "Standard"
image_name = "cmtr-12nxowyz-mod8-app"
acr_name   = "cmtr12nxowyzmod8cr"
# ACI
aci_sku  = "Standard"
aci_name = "cmtr-12nxowyz-mod8-ci"
# AKS
aks_node_pool_name      = "systempool"
aks_node_pool_count     = 1
aks_node_pool_size      = "standard_d2s_v6"
aks_node_pool_disk_type = "Managed"
location                = "francecentral"
aks_name                = "cmtr-12nxowyz-mod8-aks"

resource_group_name = "cmtr-12nxowyz-mod8-rg"
redis_name          = "cmtr-12nxowyz-mod8-redis"
common_tags = {
  Creator = "onur_atalik@epam.com"
}