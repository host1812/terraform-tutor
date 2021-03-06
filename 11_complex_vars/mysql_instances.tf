resource "azurerm_mysql_server" "instance" {
  name                = "${azurerm_resource_group.rg.name}-${var.db_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password

  sku_name   = "B_Gen5_2"
  storage_mb = var.db_size_mb
  version    = "5.7"

  auto_grow_enabled                 = var.db_auto_growth_enabled
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "db" {
  name                = "data"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.instance.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
