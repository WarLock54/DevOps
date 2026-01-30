variable "name" {
   type = string 
   description = "The name of the App Service"
    }
variable "resource_group_name" { 
  type = string 
  description = "The name of the resource group in which to create the App Service"
   }
variable "location" { 
  type = string 
  description = "The location of the App Service"
   }
variable "service_plan_id" {
   type = string
   description = "The ID of the App Service Plan"
    }
variable "tags" { 
  type = map(string)
  description = "Tags to be applied to the App Service"
   }
variable "ip_restrictions" {
  type = list(object({
    name        = string
    priority    = number
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}