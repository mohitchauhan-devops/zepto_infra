output "resource_group" {
  description = "All details of the creted resource group"
  value = {
    name = azurerm_resource_group.this.name
    location = azurerm_resource_group.this.location
    id = azurerm_resource_group.this.id
  }
}