# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "aftest" {
  name     = "rg-aftest3"
  location = "West US 3"
}



# Create a virtual network within the resource group
resource "azurerm_virtual_network" "aftest" {
  name                = "aftest-network"
  resource_group_name = azurerm_resource_group.aftest.name
  location            = azurerm_resource_group.aftest.location
  address_space       = ["10.0.0.0/16"]
}
