output "fqdn" {
     value = azurerm_traffic_manager_profile.tm.fqdn 
     description = "The fully qualified domain name of the Traffic Manager profile"
     }