resource "azurerm_public_ip" "aftest-pip1" {
  # Testing deps
  depends_on = [
    azurerm_virtual_network.aftest-vnet,
    azurerm_subnet.aftest-subnet1
  ]
  name                = "aftest-pip1"
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  allocation_method = "Static"

  tags = {
    "environment" = "staging"
  }
}
