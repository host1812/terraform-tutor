resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.rgname}-${var.bu}-${var.env}"
  location = var.rgloc
}
