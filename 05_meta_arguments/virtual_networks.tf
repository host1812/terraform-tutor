resource "azurerm_virtual_network" "aftest-vnet" {
  name                = "aftest-vnet"
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  address_space = ["10.0.0.0/16"]
  dns_servers   = ["10.0.0.4", "10.0.0.5"]

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

resource "azurerm_public_ip" "aftest-pip1" {
  # Testing deps
  # depends_on = [
  #   azurerm_virtual_network.aftest-vnet,
  #   azurerm_subnet.aftest-subnet1
  # ]
  name                = "aftest-pip1"
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  allocation_method = "Static"

  tags = {
    "environment" = "staging"
  }
}

resource "azurerm_network_interface" "aftest-nic1" {
  name                = "aftest-nic1"
  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.aftest-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.aftest-pip1.id
  }
  tags = {
    "environment" = "staging"
  }
}
