resource "azurerm_virtual_network" "this" {
  name = var.vnet_name
  resource_group_name = var.rg_name
  location = var.location
  address_space = var.address_space

dynamic "subnet" {
  for_each = var.subnets
  content {
    name = subnet.value.name
    address_prefixes = subnet.value.address_prefixes
  }
}

}

