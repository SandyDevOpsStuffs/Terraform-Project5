provider "azurerm" {
  subscription_id = "bfc289d9-f785-4f8a-b6a6-39a0e548d8c3"
  client_id       = "4fa22063-f8d7-4b03-baa2-a69eadf53157"
  client_secret   = "XOe8Q~xlh1FAr9Qie3qrVRZwApeP0XjhiROPYcAv"
  tenant_id       = "d3cce0c7-edf0-407d-b98d-f3c6f4911a06"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

}

resource "azurerm_resource_group" "str-grp" {
  name     = "str-grp"
  location = "East US"
}

resource "azurerm_storage_account" "str-acc" {
  name                     = "sdmeastusstracc1"  # Replace with a globally unique name
  location                 = "East US"
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

