resource "azurerm_subnet" "afw_snet" {
  name                 = var.snet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = local.afw_snet_prefix
}

resource "azurerm_public_ip" "afw_pip" {
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_firewall" "afw" {
  name                = var.afw_name
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.afw_snet.id
    public_ip_address_id = azurerm_public_ip.afw_pip.id
  }
}

# 1. NAT Rule Collection (Inbound NGINX Access)
resource "azurerm_firewall_nat_rule_collection" "nat" {
  name                = "nat-${var.unique_id}"
  azure_firewall_name = azurerm_firewall.afw.name
  resource_group_name = var.rg_name
  priority            = 100
  action              = "Dnat"

  rule {
    name                  = "http-ingress"
    source_addresses      = ["*"]
    destination_addresses = [azurerm_public_ip.afw_pip.ip_address]
    destination_ports     = ["80"]
    translated_address    = var.aks_lb_ip
    translated_port       = "80"
    protocols             = ["TCP"]
  }
}

# 2. Network Rule Collection (Dynamic Block Kullanımı)
resource "azurerm_firewall_network_rule_collection" "net" {
  name                = "net-${var.unique_id}"
  azure_firewall_name = azurerm_firewall.afw.name
  resource_group_name = var.rg_name
  priority            = 200
  action              = "Allow"

  dynamic "rule" {
    for_each = local.network_rules
    content {
      name                  = rule.value.name
      source_addresses      = rule.value.source_addresses
      destination_ports     = rule.value.destination_ports
      destination_addresses = rule.value.destination_addresses
      protocols             = rule.value.protocols
    }
  }
}

# 3. Application Rule Collection
resource "azurerm_firewall_application_rule_collection" "app" {
  name                = "app-${var.unique_id}"
  azure_firewall_name = azurerm_firewall.afw.name
  resource_group_name = var.rg_name
  priority            = 300
  action              = "Allow"

  rule {
    name             = "aks-fqdns"
    source_addresses = ["*"]
    target_fqdns     = ["*.azmk8s.io", "mcr.microsoft.com", "*.data.mcr.microsoft.com"]
    protocol {
      port = "443"
      type = "Https"
    }
  }
}

# Route Table & Subnet Association
resource "azurerm_route_table" "rt" {
  name                = var.rt_name
  location            = var.location
  resource_group_name = var.rg_name

  route {
    name                   = "aks-to-afw"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }
}

data "azurerm_subnet" "aks_snet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

resource "azurerm_subnet_route_table_association" "assoc" {
  subnet_id      = data.azurerm_subnet.aks_snet.id
  route_table_id = azurerm_route_table.rt.id
}