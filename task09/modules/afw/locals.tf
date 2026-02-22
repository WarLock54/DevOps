locals {
  afw_snet_prefix = [cidrsubnet(var.vnet_address_space, 8, 100)]

  network_rules = [
    {
      name                  = "allow-http-https-all"
      source_addresses      = ["*"]
      destination_ports     = ["80", "443"]
      destination_addresses = ["*"]
      protocols             = ["TCP"]
    },
    {
      name                  = "aks-service-tunnels"
      source_addresses      = ["*"]
      destination_ports     = ["9000", "1194"]
      destination_addresses = ["AzureCloud"]
      protocols             = ["TCP", "UDP"]
    },
    {
      name                  = "aks-dns"
      source_addresses      = ["*"]
      destination_ports     = ["53"]
      destination_addresses = ["*"]
      protocols             = ["UDP", "TCP"]
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