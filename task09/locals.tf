locals {
  # Azure Resource Abbreviations
  afw_name  = "${var.unique_id}-afw" # Azure Firewall
  pip_name  = "${var.unique_id}-pip" # Public IP
  rt_name   = "${var.unique_id}-rt"  # Route Table
  snet_name = "AzureFirewallSubnet"  # Required name for Firewall subnet

  # Common tags for all resources
  common_tags = {
    Environment = "Training"
    Project     = "Task09"
    ManagedBy   = "Terraform"
    Owner       = "cmtr-12nxowyz-mod9"
  }
}