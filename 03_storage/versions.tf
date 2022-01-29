terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
    random = {
      source = "hashicorp/random"
      version = "= 3.1.0"
    }
  }
}
