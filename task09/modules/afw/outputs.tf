output "public_ip" {
  value       = azurerm_public_ip.afw_pip.ip_address
  description = "Public IP address of the Azure Firewall"
}
output "private_ip" {
  value       = azurerm_firewall.afw.ip_configuration[0].private_ip_address
  description = "Private IP address of the Azure Firewall"
}