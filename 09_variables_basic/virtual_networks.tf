resource "azurerm_virtual_network" "aftest-vnet" {
  name                = "vn-${var.vn_name}"
  resource_group_name = azurerm_resource_group.rg-aftest.name
  location            = azurerm_resource_group.rg-aftest.location

  address_space = var.subnet_addresses
  dns_servers   = ["10.0.0.4", "10.0.0.5"]

  tags = {
    "environment" = "staging"
  }
}

resource "azurerm_subnet" "aftest-subnet1" {
  name                 = "vns-${var.vn_subnet}"
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = azurerm_resource_group.rg-aftest.name
  virtual_network_name = azurerm_virtual_network.aftest-vnet.name
}

resource "azurerm_subnet" "aftest-subnet2" {
  name                 = "aftest-subnet2"
  address_prefixes     = ["10.0.2.0/24"]
  resource_group_name  = azurerm_resource_group.rg-aftest.name
  virtual_network_name = azurerm_virtual_network.aftest-vnet.name
}

resource "azurerm_public_ip" "aftest-pip1" {
  name                = "aftest-pip1"
  resource_group_name = azurerm_resource_group.rg-aftest.name
  location            = azurerm_resource_group.rg-aftest.location

  allocation_method = "Static"

  sku = lookup(var.pip_sku, azurerm_resource_group.rg-aftest.location, "Basic")

  tags = {
    "environment" = "staging"
  }
}

resource "azurerm_network_interface" "aftest-nic1" {
  name                = "aftest-nic1"
  resource_group_name = azurerm_resource_group.rg-aftest.name
  location            = azurerm_resource_group.rg-aftest.location

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
