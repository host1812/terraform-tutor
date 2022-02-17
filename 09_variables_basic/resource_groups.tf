resource "azurerm_resource_group" "rg-aftest" {
  name     = "rg-${var.rgname}-${var.bu}-${var.env}"
  location = var.rgloc
}
