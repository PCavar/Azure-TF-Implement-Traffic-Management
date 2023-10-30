// Route vnet2-vnet3
resource "azurerm_route_table" "main_route_2_3" {
  name                          = var.vn2_vn3_route["vn2_vn3"].route_name_table
  resource_group_name           = azurerm_resource_group.main_rg.name
  location                      = azurerm_resource_group.main_rg.location
  disable_bgp_route_propagation = false
}

resource "azurerm_route" "route_2_3" {
  name                   = var.vn2_vn3_route["vn2_vn3"].route_name
  resource_group_name    = azurerm_resource_group.main_rg.name
  route_table_name       = azurerm_route_table.main_route_2_3.name
  address_prefix         = var.vn2_vn3_route["vn2_vn3"].routing_prefix
  next_hop_type          = var.vn2_vn3_route["vn2_vn3"].next_hop
  next_hop_in_ip_address = var.vn2_vn3_route["vn2_vn3"].next_hop_address
}

// Associate route table with vnet2
resource "azurerm_subnet_route_table_association" "association_vn2_vn3" {
  subnet_id      = azurerm_subnet.sub0_vnet2.id
  route_table_id = azurerm_route_table.main_route_2_3.id
}

// Route vnet3-vnet2
resource "azurerm_route_table" "main_route_3_2" {
  name                          = var.vn3_vn2_route["vn3_vn2"].route_name_table
  resource_group_name           = azurerm_resource_group.main_rg.name
  location                      = azurerm_resource_group.main_rg.location
  disable_bgp_route_propagation = false
}

// Route table 
resource "azurerm_route" "route_3_2" {
  name                   = var.vn3_vn2_route["vn3_vn2"].route_name
  resource_group_name    = azurerm_resource_group.main_rg.name
  route_table_name       = azurerm_route_table.main_route_3_2.name
  address_prefix         = var.vn3_vn2_route["vn3_vn2"].routing_prefix
  next_hop_type          = var.vn3_vn2_route["vn3_vn2"].next_hop
  next_hop_in_ip_address = var.vn3_vn2_route["vn3_vn2"].next_hop_address
}

// Associate route table with vnet2
resource "azurerm_subnet_route_table_association" "association_vn3_vn2" {
  subnet_id      = azurerm_subnet.sub0_vnet3.id
  route_table_id = azurerm_route_table.main_route_3_2.id
}