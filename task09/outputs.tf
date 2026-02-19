output "azure_firewall_public_ip" {
  description = "Azure Firewall Public IP address"
  value       = module.azure_firewall.public_ip # afw_logic yerine azure_firewall
}

output "azure_firewall_private_ip" {
  description = "Azure Firewall Private IP address"
  value       = module.azure_firewall.private_ip # afw_logic yerine azure_firewall
}