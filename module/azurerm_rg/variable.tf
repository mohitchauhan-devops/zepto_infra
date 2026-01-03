variable "rg_name" {
  description = "Name of the resource group"
  type =  string
}

variable "location" {
  description = "RG location"
  type = string
}

variable "tags" {
  description = "Tags for the resources"
  type = map(string)
  default = {}   
  
}