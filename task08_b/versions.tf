terraform {
  required_version = ">= 1.3.0"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    archive    = { source = "hashicorp/archive", version = "~> 2.0" }
    random     = { source = "hashicorp/random", version = "~> 3.0" }
    time       = { source = "hashicorp/time", version = "~> 0.9" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.0" }
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = module.aks.host
  client_certificate     = module.aks.client_certificate
  client_key             = module.aks.client_key
  cluster_ca_certificate = module.aks.cluster_ca_certificate
}

provider "kubectl" {
  host                   = module.aks.host
  client_certificate     = module.aks.client_certificate
  client_key             = module.aks.client_key
  cluster_ca_certificate = module.aks.cluster_ca_certificate
  load_config_file       = false
}