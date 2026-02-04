variable "resource_group_name" {
  type        = string
  description = "Mevcut kaynak grubunun adı (Task parametresi: cmaz-12nxowyz-mod7-rg-9438)"
}

variable "location" {
  type        = string
  description = "Kaynakların dağıtılacağı Azure bölgesi (Task parametresi: AustraliaCentral)"
}

variable "vm_name" {
  type        = string
  description = "Yedeklenecek olan mevcut sanal makinenin adı"
}

variable "new_vm_name" {
  type        = string
  description = "Geri yükleme işlemi sonrası oluşturulacak yeni sanal makinenin adı"
}

variable "rsv_name" {
  type        = string
  description = "Oluşturulacak Recovery Services Vault adı"
}

variable "sa_name" {
  type        = string
  description = "Geri yükleme için geçici depolama alanı olarak kullanılacak Storage Account adı"
}

variable "sa_sku" {
  type        = string
  description = "Storage Account SKU tipi (Task parametresi: Standard_LRS)"
}