resource "azurerm_virtual_network" "aftest-vnet" {
  name                = "aftest-vnet"
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  address_space = ["10.0.0.0/16"]

  tags = {
    "environment" = "staging"
  }
}

resource "azurerm_subnet" "aftest-subnet1" {
  name                 = "aftest-subnet1"
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = azurerm_resource_group.aftest-experimental.name
  virtual_network_name = azurerm_virtual_network.aftest-vnet.name
}

resource "azurerm_subnet" "aftest-subnet2" {
  name                 = "aftest-subnet2"
  address_prefixes     = ["10.0.2.0/24"]
  resource_group_name  = azurerm_resource_group.aftest-experimental.name
  virtual_network_name = azurerm_virtual_network.aftest-vnet.name
}
