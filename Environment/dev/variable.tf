variable "dev_rg_name" {
  type = map(object({
    rg_name = string
    location = string
    tags = map(string)
  }))
}

variable "dev_networking" {
  type = map(object({
    vnet_name = string
    # rg_name = string
    location = string
    address_space = list(string)
    subnets = map(object({
      name = string
      address_prefixes = list(string)
    }))
  }))
}

variable "dev_nsg" {
  description = "NSG configuration for dev environment"
  type = map(object({
    nsg_name = string
    location = string
    subnet_name = string
  }))
}

variable "dev_pip" {
  description = "Public IP configuration for dev environment"
  type = map(object({
    pip_name  = string
    location  = string
  }))
}

variable "dev_vm" {
  type = map(object({
    nic_name       = string
    vm_name        = string
    vm_size        = string
    location       = string
    subnet_name    = string
    admin_username = string
    admin_password = string
  }))
}

variable "dev_sql_server" {
  type = map(object({
    server_name = string
    location = string
    administrator_login = string
    administrator_login_password = string
  }))
}

variable "dev_sql_database" {
  type = map(object({
    db_name = string
  }))
}