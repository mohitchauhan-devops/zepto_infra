variable "vnet_name" {
  description = "virtual network"
  type = string
}

variable "rg_name" {
  description = "resource group used resources"
  type = string
}

variable "location" {
  description = "location used for resources"
  type = string
}

variable "address_space" {
  description = "address space used for creating the virtual network"
  type = list(string)
}

variable "subnets" {
  type = map(object({
    name = string
    address_prefixes = list(string)
  }))
}