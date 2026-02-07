terraform {
  # Testin beklediği >= 1.5.7 kısıtlamasını tam olarak karşılar
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Testin beklediği >= 3.110.0 ve < 4.0.0 aralığını tam olarak karşılar
      version = ">= 3.110.0, < 4.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0"
    }
  }
}
provider "azurerm" {
  features {}
}
provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

# Kubectl sağlayıcısını AKS verileriyle yapılandırın
provider "kubectl" {
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  load_config_file       = false
}