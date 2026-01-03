variable "pip_name" {
  description = "Name of the public IP"
  type        = string
}

variable "location" {
  description = "Location of the public IP"
  type        = string
}

variable "rg_name" {
  description = "Resource Group where the PIP will be created"
  type        = string
}