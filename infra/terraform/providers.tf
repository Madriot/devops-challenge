terraform {
  backend "azurerm" {
    resource_group_name  = "![SHARED_RG]"
    storage_account_name = "![SHARED_STORAGE_ACCOUNT]"
    container_name       = "![TFSTATE_CONTAINER]"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
}

provider "azurerm" {
  features {}

  resource_provider_registrations = "none"
}