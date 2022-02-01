resource "azurerm_resource_group" "rg-aftest" {
  for_each = {
    app1 = "eastus"
    app2 = "eastus2"
    app3 = "westus"
  }
  name     = "rg-${each.key}"
  location = each.value
}
