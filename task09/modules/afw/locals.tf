locals {
  afw_snet_prefix = ["10.0.100.0/24"]

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
      destination_ports     = ["9000", "1194"] # AKS tünel portları
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