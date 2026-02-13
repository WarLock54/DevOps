output "aca_fqdn" {
  value       = azurerm_container_app.app.latest_revision_fqdn
  description = "The Fully Qualified Domain Name of the Azure Container App"
}