resource "azurerm_resource_group" "main_rg" {
  name     = "az104-06-rg1"
  location = "North Europe"
}

resource "azurerm_resource_group" "main_rg_1" {
  name     = "az104-06-rg4"
  location = "North Europe"
}

resource "azurerm_resource_group" "main_rg_2" {
  name     = "az104-06-rg5"
  location = "North Europe"
}