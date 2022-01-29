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

resource "azurerm_user_assigned_identity" "aftest-mi" {
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  name = "aftest-mi"
}

resource "azurerm_role_assignment" "aftest-assignment" {
  scope                = azurerm_resource_group.aftest-experimental.id
  role_definition_name = "Reader"
  principal_id = azurerm_user_assigned_identity.aftest-mi.principal_id
}
