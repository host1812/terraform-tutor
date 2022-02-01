resource "azurerm_linux_virtual_machine" "vm-aftest" {
  name          = "vm-aftest"
  computer_name = "aftest"

  resource_group_name = azurerm_resource_group.aftest-experimental.name
  location            = azurerm_resource_group.aftest-experimental.location

  size           = "Standard_DS1_v2"
  admin_username = "azureuser"

  network_interface_ids = [azurerm_network_interface.aftest-nic1.id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/files/tf.pub")
  }

  os_disk {
    name                 = "vm-aftest-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }

  custom_data = filebase64("${path.module}/files/app1-cloud-init.txt")
}
