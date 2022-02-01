resource "azurerm_public_ip" "aftest-pip" {
  count = 3
  # Testing deps
  depends_on = [
    azurerm_virtual_network.aftest-vnet,
    azurerm_subnet.aftest-subnet1
  ]
  name                = "aftest-pip-${count.index + 1}"
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  allocation_method = "Static"

  domain_name_label = "af-app-${count.index}-${random_string.random.id}"

  tags = {
    "environment" = "staging"
  }
}
