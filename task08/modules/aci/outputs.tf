output "fqdn" {
  description = "Fully Qualified Domain Name of the Azure Container Instance"
  value       = azurerm_container_group.aci.fqdn
}

output "ip_address" {
  description = "Public IP address of the Azure Container Instance"
  value       = azurerm_container_group.aci.ip_address
}
