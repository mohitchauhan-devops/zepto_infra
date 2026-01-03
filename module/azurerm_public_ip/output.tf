output "pip_id" {
  description = "ID of the public IP"
  value       = azurerm_public_ip.this.id
}