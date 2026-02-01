variable "location" { 
    type = string 
    description = "The Azure region where resources will be deployed."
    }
variable "resource_group_name" { 
    type = string
    description = "The name of the resource group where resources will be deployed."
    }
variable "sql_server_name" { 
    type = string
    description = "The name of the SQL server."
}
variable "sql_db_name" {
     type = string
     description = "The name of the SQL database."
      }
variable "sql_sku" { 
    type = string 
    description = "The SKU name for the SQL database."
    }
variable "sql_admin_username" { 
    type = string 
    description = "administrator username for the SQL server."
    }
variable "sql_admin_secret_name" { 
    type = string 
    description = "The name of the secret in Key Vault that stores the SQL admin username."
    }
variable "sql_admin_secret_password" { 
    type = string 
    description = "The name of the secret in Key Vault that stores the SQL admin password."
}
variable "key_vault_id" { 
    type = string
    description = "The ID of the Key Vault where SQL admin password is stored."
}
variable "allowed_ip_address" { 
    type = string 
    description = "The IP address allowed to access the SQL server."
    }
variable "sql_fwr_name" { 
    type = string 
    description = "The name of the SQL firewall rule."
    }
variable "tags" { 
    type = map(string)
    description = "Tags to be applied to the SQL resources."
     }