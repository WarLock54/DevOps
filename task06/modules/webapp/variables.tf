variable "location" { 
    type = string 
    description = "The Azure region where resources will be deployed."
    }
variable "resource_group_name" { 
    type = string
    description = "The name of the resource group where resources will be deployed."
    }
variable "asp_name" { 
    type = string
    description = "The name of the App Service Plan."
    }
variable "asp_sku" { 
    type = string
    description = "The SKU name for the App Service Plan."
    }
variable "app_name" { 
    type = string 
    description = "The name of the Linux Web App."
    }
variable "app_dotnet_version" { 
    type = string
    description = "The .NET version for the Linux Web App."
     }
variable "sql_connection_string" {
     type = string
     description = "The connection string for the SQL database."
      }
variable "tags" { 
    type = map(string)
    description = "Tags to be applied to the Web App resources."
     }