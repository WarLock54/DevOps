output "app_hostname" {
  value       = azurerm_linux_web_app.app.default_hostname
  description = "azure web app hostname"
}