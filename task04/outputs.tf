output "vm_public_ip" {
  value = azurerm_public_ip.pip.ip_address
  description = "public IP"
}

output "vm_fqdn" {
  value = azurerm_public_ip.pip.fqdn
  description = "public fqdn"
}