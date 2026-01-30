variable "name" {
     type = string
     description = "The name of the App Service Plan"
      }
variable "resource_group_name" {
     type = string 
     description = "The name of the resource group in which to create the App Service Plan"
     }
variable "location" { 
    type = string 
    description = "The location of the App Service Plan"
     }
variable "sku_name" { 
    type = string 
    description = "The SKU name of the App Service Plan"
     }
variable "worker_count" { 
    type = number 
    description = "The number of workers to use for the App Service Plan"
    }
variable "tags" { 
    type = map(string) 
    description = "Tags to be applied to the App Service Plan"
     }