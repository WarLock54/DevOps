variable "name" { 
    type = string
     description = "The name of the Traffic Manager profile"
     }
variable "resource_group_name" { 
    type = string
     description = "The name of the resource group in which to create the Traffic Manager profile"
     }
variable "routing_method" { 
    type = string 
    description = "The routing method for the Traffic Manager profile"
     }
variable "tags" { 
    type = map(string) 
    description = "Tags to be applied to the Traffic Manager profile"
     }
variable "endpoints" { 
    type = map(string) 
    description = "The endpoints for the Traffic Manager profile"
    }