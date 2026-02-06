resources_name_prefix = "cmtr-12nxowyz-mod8" # Prefix olarak bunu kullanacağız
student_email         = "onur_atalik@epam.com"

# Redis
redis_capacity    = 2
redis_sku         = "Basic"
redis_sku_family  = "C"
redis_hostname    = "redis-hostname"
redis_primary_key = "redis-primary-key"

# Key Vault
keyvault_sku = "standard"

# ACR
acr_sku    = "Basic"
image_name = "cmtr-12nxowyz-mod8-app"

# ACI
aci_sku = "Standard"

# AKS
aks_node_pool_name      = "system"
aks_node_pool_count     = 1
aks_node_pool_size      = "Standard_B2s"
aks_node_pool_disk_type = "Managed"
location                = "francecentral"
git_pat                 = "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"