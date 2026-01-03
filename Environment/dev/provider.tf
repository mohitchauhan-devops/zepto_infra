terraform {
  required_version = ">= 1.3.0"

  backend "azurerm" {
    resource_group_name  = "data-rg"
    storage_account_name = "pistg"
    container_name       = "mycontainer"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "06068ec2-4e5f-4f32-8127-7e7caab01c80"
}
