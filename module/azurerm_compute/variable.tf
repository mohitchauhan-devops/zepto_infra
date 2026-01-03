variable "nic_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
