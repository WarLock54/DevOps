output "azure_firewall_public_ip" {
  description = "Azure Firewall Public IP address"
  value       = module.azure_firewall.public_ip
}

output "azure_firewall_private_ip" {
  description = "Azure Firewall Private IP address"
  value       = module.azure_firewall.private_ip
}