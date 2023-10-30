// locals for application gateway
locals {
  backend_address_pool_name      = "${azurerm_virtual_network.main_vnet1.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.main_vnet1.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.main_vnet1.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.main_vnet1.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.main_vnet1.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.main_vnet1.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.main_vnet1.name}-rdrcfg"
}