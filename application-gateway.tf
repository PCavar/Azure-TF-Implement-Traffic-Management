// Public IP for APP-GW
resource "azurerm_public_ip" "app_gw_pub" {
  name                = var.app_gw_pubip_config["app_gw1"].name
  resource_group_name = azurerm_resource_group.main_rg_2.name
  location            = azurerm_resource_group.main_rg_2.location
  allocation_method   = var.app_gw_pubip_config["app_gw1"].allo_methd
  sku                 = var.pub_ip_sku[1]
}

// Frontend for the app-gw
resource "azurerm_subnet" "app_gw_frontend" {
  name                 = var.app_gw_subnet["app_gw_front1"].sub_name
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet1.name
  address_prefixes     = [var.app_gw_subnet["app_gw_front1"].sub_range]
}

// Creating App-GW
resource "azurerm_application_gateway" "app_gw" {
  name                = var.app_gw1["app_gw_1"].name
  resource_group_name = azurerm_resource_group.main_rg_2.name
  location            = azurerm_resource_group.main_rg_2.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "App-GW-Configuration"
    subnet_id = azurerm_subnet.app_gw_frontend.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.app_gw_pub.id
  }

  backend_address_pool {
    name         = local.backend_address_pool_name
    ip_addresses = ["10.62.0.4", "10.63.0.4"]
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}