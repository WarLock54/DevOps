locals {
  afw_snet_prefix = ["10.0.100.0/24"]

  network_rules = [
    {
      name                  = "allow-http-all" # Bu kural eksik olabilir
      source_addresses      = ["*"]
      destination_ports     = ["80"]
      destination_addresses = ["*"]
      protocols             = ["TCP"]
    },
    {
      name                  = "allow-aks-management"
      source_addresses      = ["*"]
      destination_ports     = ["443", "9000"]
      destination_addresses = ["AzureCloud"]
      protocols             = ["TCP"]
    },
    {
      name                  = "allow-ntp"
      source_addresses      = ["*"]
      destination_ports     = ["123"]
      destination_addresses = ["*"]
      protocols             = ["UDP"]
    }
  ]
}