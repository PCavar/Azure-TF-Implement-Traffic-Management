// Configuration for vnet1 including its Subnet0,Subnet1,- sub0,- sub1
resource "azurerm_virtual_network" "main_vnet1" {
  name                = var.vnet1_config["vnet1"].vnet_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  address_space       = [var.vnet1_config["vnet1"].vnet_cidr]
}

resource "azurerm_subnet" "sub0_vnet1" {
  name                 = var.vnet1_config["vnet1"].subnet_name_0
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet1.name
  address_prefixes     = [var.vnet1_config["vnet1"].subnet_cidr_0]
}

resource "azurerm_subnet" "sub1_vnet1" {
  name                 = var.vnet1_config["vnet1"].subnet_name_1
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet1.name
  address_prefixes     = [var.vnet1_config["vnet1"].subnet_cidr_1]
}

// Configuration for vnet2 including its Subnet0,- sub0
resource "azurerm_virtual_network" "main_vnet2" {
  name                = var.vnet2_config["vnet2"].vnet_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  address_space       = [var.vnet2_config["vnet2"].vnet_cidr]
}

resource "azurerm_subnet" "sub0_vnet2" {
  name                 = var.vnet2_config["vnet2"].subnet_name_0
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet2.name
  address_prefixes     = [var.vnet2_config["vnet2"].subnet_cidr_0]
}

// Configuration for vnet3 including its Subnet0,- Sub0
resource "azurerm_virtual_network" "main_vnet3" {
  name                = var.vnet3_config["vnet3"].vnet_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  address_space       = [var.vnet3_config["vnet3"].vnet_cidr]
}

resource "azurerm_subnet" "sub0_vnet3" {
  name                 = var.vnet3_config["vnet3"].subnet_name_0
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet3.name
  address_prefixes     = [var.vnet3_config["vnet3"].subnet_cidr_0]
}