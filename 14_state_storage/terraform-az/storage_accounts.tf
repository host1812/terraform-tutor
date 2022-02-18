resource "azurerm_storage_account" "terraform" {
  name                     = "${var.bu}${var.env}${var.storage_account_name}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.env
  }
}

resource "azurerm_storage_container" "terraform" {
  for_each              = var.storage_containers
  name                  = each.key
  storage_account_name  = azurerm_storage_account.terraform.name
  container_access_type = "private"
}
