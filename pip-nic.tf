// Creating private,public ips and NICs

resource "azurerm_public_ip" "pub_vm0" {
  name                = var.vm0_pub_ip_config["vm0_pub"].name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  allocation_method   = var.vm0_pub_ip_config["vm0_pub"].allocation
  sku                 = var.pub_ip_sku[1]
}

resource "azurerm_network_interface" "nic_vm0" {
  name                = var.vm0_vm1_config["vm0"].vm_nic_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location

  ip_configuration {
    name                          = var.vm0_vm1_config["vm0"].vm_nic_name
    subnet_id                     = azurerm_subnet.sub0_vnet1.id
    private_ip_address_allocation = var.vm0_vm1_config["vm0"].allo_methd
    public_ip_address_id          = azurerm_public_ip.pub_vm0.id
  }
  enable_ip_forwarding = true
}

resource "azurerm_public_ip" "pub_vm1" {
  name                = var.vm1_pub_ip_config["vm1_pub"].name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  allocation_method   = var.vm1_pub_ip_config["vm1_pub"].allocation
  sku                 = var.pub_ip_sku[1]
}

resource "azurerm_network_interface" "nic_vm1" {
  name                = var.vm0_vm1_config["vm1"].vm_nic_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location

  ip_configuration {
    name                          = var.vm0_vm1_config["vm1"].vm_nic_name
    subnet_id                     = azurerm_subnet.sub1_vnet1.id
    private_ip_address_allocation = var.vm0_vm1_config["vm1"].allo_methd
    public_ip_address_id          = azurerm_public_ip.pub_vm1.id
  }
}

resource "azurerm_public_ip" "pub_vm2" {
  name                = var.vm2_pub_ip_config["vm2_pub"].name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  allocation_method   = var.vm2_pub_ip_config["vm2_pub"].public_allocation
  sku                 = var.pub_ip_sku[1]
}

resource "azurerm_network_interface" "nic_vm2" {
  name                = var.vm2_config["vm2"].vm_nic_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location

  ip_configuration {
    name                          = var.vm2_config["vm2"].vm_nic_name
    subnet_id                     = azurerm_subnet.sub0_vnet2.id
    private_ip_address_allocation = var.vm2_pub_ip_config["vm2_pub"].private_allocation
    public_ip_address_id          = azurerm_public_ip.pub_vm2.id
  }
}

resource "azurerm_public_ip" "pub_vm3" {
  name                = var.vm3_pub_ip_config["vm3_pub"].name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  allocation_method   = var.vm3_pub_ip_config["vm3_pub"].public_allocation
  sku                 = var.pub_ip_sku[1]
}

resource "azurerm_network_interface" "nic_vm3" {
  name                = var.vm3_config["vm3"].vm_nic_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location

  ip_configuration {
    name                          = var.vm3_config["vm3"].vm_nic_name
    subnet_id                     = azurerm_subnet.sub0_vnet3.id
    private_ip_address_allocation = var.vm3_pub_ip_config["vm3_pub"].private_allocation
    public_ip_address_id          = azurerm_public_ip.pub_vm3.id
  }
}