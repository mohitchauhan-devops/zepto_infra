module "resource_group" {
  source = "../../module/azurerm_rg"
  for_each = var.dev_rg_name

  rg_name  = each.value.rg_name
  location = each.value.location
  tags = each.value.tags
}

module "networking" {
  source = "../../module/azurerm_networking"
  for_each = var.dev_networking

  vnet_name = each.value.vnet_name
  rg_name = module.resource_group["rg1"].resource_group.name
  location = each.value.location
  address_space = each.value.address_space
  subnets = each.value.subnets
}


module "nsg" {
  source   = "../../module/azurerm_nsg"
  for_each = var.dev_nsg

  nsg_name = each.value.nsg_name
  location = each.value.location

  rg_name = module.resource_group["rg1"].resource_group.name

  subnet_id = module.networking["vnet"].subnet_ids[each.value.subnet_name]
}

module "pip" {
  source   = "../../module/azurerm_public_ip"
  for_each = var.dev_pip

  pip_name = each.value.pip_name
  location = each.value.location
  rg_name  = module.resource_group["rg1"].resource_group.name
}

module "nic_vm" {
  source = "../../module/azurerm_compute"
  for_each = var.dev_vm

  nic_name = each.value.nic_name
  vm_name  = each.value.vm_name
  vm_size  = each.value.vm_size

  location = each.value.location
  rg_name  = module.resource_group["rg1"].resource_group.name

  # EXISTING OUTPUTS USE HO RAHE HAIN
  subnet_id    = module.networking["vnet"].subnet_ids[each.value.subnet_name]
  public_ip_id = module.pip[each.key].pip_id

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  tags = {
    environment = "dev"
  }
}

module "sql_server" {
  source = "../../module/azurerm_mssql_server"
  for_each = var.dev_sql_server

  server_name = each.value.server_name
  rg_name = module.resource_group["rg1"].resource_group.name
  location = each.value.location
  administrator_login = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}


module "sql_database" {
  source = "../../module/azurerm_mssql_database"
  for_each = var.dev_sql_database
  db_name = each.value.db_name
  server_id = module.sql_server["server"].sql_server_id
}


