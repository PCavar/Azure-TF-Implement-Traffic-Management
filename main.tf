// Provisioning vm0,vm1 in Vnet1
resource "azurerm_windows_virtual_machine" "win_vm0" {
  name                = var.vm0_vm1_config["vm0"].vm_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  size                = var.vm0_vm1_config["vm0"].size
  admin_username      = var.vm0_vm1_config["vm0"].admin_name
  admin_password      = var.vm0_vm1_config["vm0"].admin_pass

  network_interface_ids = [
    azurerm_network_interface.nic_vm0.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.src_img_ref["source_vm"].publisher
    offer     = var.src_img_ref["source_vm"].offer
    sku       = var.src_img_ref["source_vm"].sku
    version   = var.src_img_ref["source_vm"].version
  }
}


resource "azurerm_virtual_machine_extension" "powershell_script" {
  name                 = "EnableRouting"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm0.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/PCavar/Azure-Terraform-03/main/routingScript.ps1"],
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File routingScript.ps1"
    }
  SETTINGS
}

resource "azurerm_windows_virtual_machine" "win_vm1" {
  name                = var.vm0_vm1_config["vm1"].vm_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  size                = var.vm0_vm1_config["vm1"].size
  admin_username      = var.vm0_vm1_config["vm1"].admin_name
  admin_password      = var.vm0_vm1_config["vm1"].admin_pass

  network_interface_ids = [
    azurerm_network_interface.nic_vm1.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.src_img_ref["source_vm"].publisher
    offer     = var.src_img_ref["source_vm"].offer
    sku       = var.src_img_ref["source_vm"].sku
    version   = var.src_img_ref["source_vm"].version
  }
}

resource "azurerm_virtual_machine_extension" "webserver_iis_script1" {
  name                 = "webserverIIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm1.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/PCavar/Azure-Terraform-03/main/Webserver-IIS.ps1"],
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File Webserver-IIS.ps1"
    }
  SETTINGS
}

// Provisioning vm2 in Vnet2
resource "azurerm_windows_virtual_machine" "win_vm2" {
  name                = var.vm2_config["vm2"].vm_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  size                = var.vm2_config["vm2"].size
  admin_username      = var.vm2_config["vm2"].admin_name
  admin_password      = var.vm2_config["vm2"].admin_pass

  network_interface_ids = [
    azurerm_network_interface.nic_vm2.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.src_img_ref["source_vm"].publisher
    offer     = var.src_img_ref["source_vm"].offer
    sku       = var.src_img_ref["source_vm"].sku
    version   = var.src_img_ref["source_vm"].version
  }
}

resource "azurerm_virtual_machine_extension" "webserver_iis_script2" {
  name                 = "webserverIIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm2.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/PCavar/Azure-Terraform-03/main/Webserver-IIS.ps1"],
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File Webserver-IIS.ps1"
    }
  SETTINGS
}

// Provisioning vm3 in Vnet3
resource "azurerm_windows_virtual_machine" "win_vm3" {
  name                = var.vm3_config["vm3"].vm_name
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  size                = var.vm3_config["vm3"].size
  admin_username      = var.vm3_config["vm3"].admin_name
  admin_password      = var.vm3_config["vm3"].admin_pass

  network_interface_ids = [
    azurerm_network_interface.nic_vm3.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.src_img_ref["source_vm"].publisher
    offer     = var.src_img_ref["source_vm"].offer
    sku       = var.src_img_ref["source_vm"].sku
    version   = var.src_img_ref["source_vm"].version
  }
}

resource "azurerm_virtual_machine_extension" "webserver_iis_script3" {
  name                 = "webserverIIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm3.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/PCavar/Azure-Terraform-03/main/Webserver-IIS.ps1"],
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File Webserver-IIS.ps1"
    }
  SETTINGS
}