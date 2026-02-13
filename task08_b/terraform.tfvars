# Genel Tanımlamalar
resources_name_prefix = "cmtr-12nxowyz-mod8b"
student_email         = "onur_atalik@epam.com"
location              = "francecentral"

# Storage Account Ayarları
sa_replication_type = "LRS"
sa_container_name   = "app-content"

# Key Vault Ayarları
keyvault_sku = "standard"

# Container Registry Ayarları
acr_sku    = "Basic" # Task parametresinde Basic istenmiş
image_name = "cmtr-12nxowyz-mod8b-app"

# Container App Ayarları
aca_env_workload_profile_type = "Consumption"

# Azure Kubernetes Service (AKS) Ayarları
aks_node_pool_name      = "system"
aks_node_pool_count     = 1
aks_node_pool_size      = "Standard_D2ads_v6"
aks_node_pool_disk_type = "Ephemeral"

# Redis ACI Ayarları
redis_aci_sku = "Standard"