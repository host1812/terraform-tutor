resource "azurerm_network_interface" "aftest-nic" {
  count               = 3
  name                = "aftest-nic-${count.index + 1}"
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.aftest-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.aftest-pip[*].id, count.index)
  }
  tags = {
    "environment" = "staging"
  }
}
