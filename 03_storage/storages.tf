resource "random_string" "random" {
  length = 4
  special = false
  upper = false
}

resource "azurerm_storage_account" "aftest-storage" {
  name = "afteststorage${random_string.random.id}"
  location = azurerm_resource_group.aftest-experimental.location
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  account_tier = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}