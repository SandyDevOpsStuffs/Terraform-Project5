resource "azurerm_resource_group" "str-grp" {
  name     = "str-grp"
  location = "West India"

}

resource "azurerm_storage_account" "str-acc" {
  name                     = "sdmstracc1"
  location                 = "West India"
  resource_group_name      = azurerm_resource_group.str-grp.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "str-con" {
  name                  = "str-con-1"
  storage_account_name  = azurerm_storage_account.str-acc.name
  container_access_type = "private"

}

resource "azurerm_storage_blob" "str-blob" {
  name                   = "test.txt"
  storage_account_name   = azurerm_storage_account.str-acc.name
  storage_container_name = azurerm_storage_container.str-con.name
  type                   = "Block"
  source                 = "test.txt"


}



