// Local Peering between vnet1-vnet2
resource "azurerm_virtual_network_peering" "vnet1-vnet2" {
  name                      = var.local_peering[0]
  resource_group_name       = azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.main_vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.main_vnet2.id
}

resource "azurerm_virtual_network_peering" "vnet2-vnet1" {
  name                      = var.local_peering[1]
  resource_group_name       = azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.main_vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.main_vnet1.id
}

// Local Peering between vnet1-vnet3
resource "azurerm_virtual_network_peering" "vnet1-vnet3" {
  name                      = var.local_peering[2]
  resource_group_name       = azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.main_vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.main_vnet3.id
}

resource "azurerm_virtual_network_peering" "vnet3-vnet1" {
  name                      = var.local_peering[3]
  resource_group_name       = azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.main_vnet3.name
  remote_virtual_network_id = azurerm_virtual_network.main_vnet1.id
}
