resource "azurerm_virtual_network" "aftest-vnet" {
  name                = "vn-${var.vnname}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  address_space = ["10.0.0.0/24"]
  dns_servers   = ["10.0.0.4", "10.0.0.5"]

  tags = {
    "environment" = "staging"
  }
}
