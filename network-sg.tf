// Vnet1, Subnet0 - NSG Rules
resource "azurerm_network_security_group" "vnet1_sub0" {
  name                = "Vnet1-Sub0-NSG"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
}

resource "azurerm_subnet_network_security_group_association" "vnet1_sub0" {
  subnet_id                 = azurerm_subnet.sub0_vnet1.id
  network_security_group_id = azurerm_network_security_group.vnet1_sub0.id
}

resource "azurerm_network_security_rule" "vnet1_sub0_rule1" {
  name                        = "AllowHTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet1_sub0.name
}

resource "azurerm_network_security_rule" "vnet1_sub0_rule2" {
  name                        = "AllowRDS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet1_sub0.name
}

// Vnet1, Subnet1 - NSG Rules
resource "azurerm_network_security_group" "vnet1_sub1" {
  name                = "Vnet1-Sub1-NSG"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
}

resource "azurerm_subnet_network_security_group_association" "vnet1_sub1" {
  subnet_id                 = azurerm_subnet.sub1_vnet1.id
  network_security_group_id = azurerm_network_security_group.vnet1_sub1.id
}

resource "azurerm_network_security_rule" "vnet1_sub1_rule1" {
  name                        = "AllowHTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet1_sub1.name
}

resource "azurerm_network_security_rule" "vnet1_sub1_rule2" {
  name                        = "AllowRDS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet1_sub1.name
}

// Vnet2 , Subnet0 - NSG Rules
resource "azurerm_network_security_group" "vnet2_sub0" {
  name                = "Vnet2-Sub0-NSG"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
}

resource "azurerm_subnet_network_security_group_association" "vnet2_sub0" {
  subnet_id                 = azurerm_subnet.sub0_vnet2.id
  network_security_group_id = azurerm_network_security_group.vnet2_sub0.id
}

resource "azurerm_network_security_rule" "vnet2_sub0_rule1" {
  name                        = "AllowHTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet2_sub0.name
}

resource "azurerm_network_security_rule" "vnet2_sub0_rule2" {
  name                        = "AllowRDS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet2_sub0.name
}

// Vnet3 , Subnet0 - NSG Rules
resource "azurerm_network_security_group" "vnet3_sub0" {
  name                = "Vnet3-Sub0-NSG"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
}

resource "azurerm_subnet_network_security_group_association" "vnet3_sub0" {
  subnet_id                 = azurerm_subnet.sub0_vnet3.id
  network_security_group_id = azurerm_network_security_group.vnet3_sub0.id
}

resource "azurerm_network_security_rule" "vnet3_sub0_rule1" {
  name                        = "AllowHTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet3_sub0.name
}

resource "azurerm_network_security_rule" "vnet3_sub0_rule2" {
  name                        = "AllowRDS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main_rg.name
  network_security_group_name = azurerm_network_security_group.vnet3_sub0.name
}