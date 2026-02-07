variable "resource_group_location" {
  type        = string
  description = "Azure kaynaklarının konuşlandırılacağı bölge."
  default     = "francecentral"
}
variable "common_tags" {
  type        = map(string)
  description = "Tüm kaynaklara uygulanacak ortak etiketler."
  default     = {}
}
variable "location" {
  type        = string
  description = "Tüm kaynaklara uygulanacak ortak konum etiketi."
}
variable "resources_name_prefix" {
  type        = string
  description = "Kaynak isimlerinin başına eklenecek benzersiz ön ek."
}

variable "student_email" {
  type        = string
  description = "Kaynak etiketlerinde (tags) kullanılacak olan oluşturucu e-posta adresi."
}

variable "git_pat" {
  type        = string
  description = "ACR Task'in kaynak koduna erişebilmesi için kullanılan GitHub Personal Access Token. (Sensitive)"
  sensitive   = true
}

# Redis Variables
variable "redis_capacity" {
  type        = number
  description = "Redis Cache servisinin kapasite değeri (örn: 0, 1, 2)."
}

variable "redis_sku" {
  type        = string
  description = "Redis Cache SKU adı (Basic, Standard, Premium)."
}

variable "redis_sku_family" {
  type        = string
  description = "Redis SKU ailesi (C = Basic/Standard, P = Premium)."
}

variable "redis_hostname" {
  type        = string
  description = "Key Vault içerisinde saklanacak Redis hostname secret adı."
}

variable "redis_primary_key" {
  type        = string
  description = "Key Vault içerisinde saklanacak Redis primary access key secret adı."
}

# Key Vault Variables
variable "keyvault_sku" {
  type        = string
  description = "Key Vault fiyatlandırma katmanı (standard veya premium)."
}

# ACR Variables
variable "acr_sku" {
  type        = string
  description = "Azure Container Registry SKU (Basic, Standard, Premium)."
}

variable "image_name" {
  type        = string
  description = "Oluşturulacak Docker imajının adı."
}

# ACI Variables
variable "aci_sku" {
  type        = string
  description = "Azure Container Instance SKU tipi."
}

# AKS Variables
variable "aks_node_pool_name" {
  type        = string
  description = "AKS varsayılan node pool adı."
}

variable "aks_node_pool_count" {
  type        = number
  description = "AKS node pool içerisindeki node sayısı."
}

variable "aks_node_pool_size" {
  type        = string
  description = "AKS node pool içerisindeki VM boyutu (örn: Standard_DS2_v2)."
}

variable "aks_node_pool_disk_type" {
  type        = string
  description = "AKS node'ları için kullanılacak işletim sistemi disk tipi."
}