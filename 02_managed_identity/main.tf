terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aftest-experimental" {
  name     = "rg-aftest-experimental"
  location = "West US 3"
}

resource "azurerm_role_assignment" "aftest-mi" {
  scope                = azurerm_resource_group.aftest-experimental.id
  role_definition_name = "Reader"
  # principal_id         = data.azurerm_client_config.example.object_id
}