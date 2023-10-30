//
resource "azurerm_public_ip" "public_ip_lb" {
  name                = var.loadbalancer_config["lb1"].pub_ip_lb_name
  resource_group_name = azurerm_resource_group.main_rg_1.name
  location            = azurerm_resource_group.main_rg_1.location
  allocation_method   = var.loadbalancer_config["lb1"].alloca_method
  sku                 = var.loadbalancer_config["lb1"].sku
}

// Creating loadbalancer
resource "azurerm_lb" "main_lb" {
  name                = var.loadbalancer_config["lb1"].lb4_name
  resource_group_name = azurerm_resource_group.main_rg_1.name
  location            = azurerm_resource_group.main_rg_1.location
  sku                 = var.pub_ip_sku[1]

  frontend_ip_configuration {
    name                 = var.loadbalancer_config["lb1"].lb4_fe_name
    public_ip_address_id = azurerm_public_ip.public_ip_lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "main_be_pool" {
  name            = var.loadbalancer_config["lb1"].lb4_be_name
  loadbalancer_id = azurerm_lb.main_lb.id
}

// Probe is cheking health of backend resources
resource "azurerm_lb_probe" "web_lb_probe" {
  name            = "TCP-Probe"
  protocol        = "Tcp"
  port            = 80
  loadbalancer_id = azurerm_lb.main_lb.id
}

// Rule/s for loadbalancer
resource "azurerm_lb_rule" "lb_rule_http" {
  name                           = "AllowHTTP"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.main_lb.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.web_lb_probe.id
  loadbalancer_id                = azurerm_lb.main_lb.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.main_be_pool.id]
}

// Associating NIC with backend pool for loadbalancer
resource "azurerm_network_interface_backend_address_pool_association" "be_nic_lb_associate1" {
  network_interface_id    = azurerm_network_interface.nic_vm0.id
  ip_configuration_name   = azurerm_network_interface.nic_vm0.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.main_be_pool.id
}

// Associating NIC with backend pool for loadbalancer
resource "azurerm_network_interface_backend_address_pool_association" "be_nic_lb_associate2" {
  network_interface_id    = azurerm_network_interface.nic_vm1.id
  ip_configuration_name   = azurerm_network_interface.nic_vm1.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.main_be_pool.id
}