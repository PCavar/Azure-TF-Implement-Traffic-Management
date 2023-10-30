// Vnet1,- Sub0,Sub1 Configuration
variable "vnet1_config" {
  type = map(object({
    vnet_name     = string
    vnet_cidr     = string
    subnet_name_0 = string
    subnet_name_1 = string
    subnet_cidr_0 = string
    subnet_cidr_1 = string
  }))
  default = {
    vnet1 = {
      vnet_name     = "az104-06-vnet1"
      vnet_cidr     = "10.60.0.0/22"
      subnet_name_0 = "Subnet0"
      subnet_name_1 = "Subnet1"
      subnet_cidr_0 = "10.60.0.0/24"
      subnet_cidr_1 = "10.60.1.0/24"
    }
  }
}

// Vnet2,- Sub0 Configuration
variable "vnet2_config" {
  type = map(object({
    vnet_name     = string
    vnet_cidr     = string
    subnet_name_0 = string
    subnet_cidr_0 = string
  }))
  default = {
    vnet2 = {
      vnet_name     = "az104-06-vnet2"
      vnet_cidr     = "10.62.0.0/22"
      subnet_name_0 = "Subnet0"
      subnet_cidr_0 = "10.62.0.0/24"
    }
  }
}

// Vnet3,- Sub0 Configuration
variable "vnet3_config" {
  type = map(object({
    vnet_name     = string
    vnet_cidr     = string
    subnet_name_0 = string
    subnet_cidr_0 = string
  }))
  default = {
    vnet3 = {
      vnet_name     = "az104-06-vnet3"
      vnet_cidr     = "10.63.0.0/22"
      subnet_name_0 = "Subnet0"
      subnet_cidr_0 = "10.63.0.0/24"
    }
  }
}

// vm0,vm1 Configuration for(vnet1,- sub0,sub1)
// Having sensitive information like subscription-ID, passwords
// and other information directly into your files is not considered
// safe or best practice. Hence not recommended.
// Storing username/password for users like this is only for learning purpose!
variable "vm0_vm1_config" {
  type = map(object({
    vm_name     = string
    vm_nic_name = string
    size        = string
    admin_name  = string
    admin_pass  = string
    allo_methd  = string
  }))
  default = {
    vm0 = {
      vm_name     = "vm0"
      vm_nic_name = "vm0-nic"
      size        = "Standard_D2_v2"
      admin_name  = "kalleanka"
      admin_pass  = "kalleanka12345!"
      allo_methd  = "Dynamic"
    },
    vm1 = {
      vm_name     = "vm1"
      vm_nic_name = "vm1-nic"
      size        = "Standard_D2_v2"
      admin_name  = "kalleanka"
      admin_pass  = "kalleanka12345!"
      allo_methd  = "Dynamic"
    }
  }
}

//Public ips for vm0,vm1 in loadbalancer with matching SKU
variable "vm0_pub_ip_config" {
  type = map(object({
    name       = string
    sku        = string
    allocation = string
  }))
  default = {
    vm0_pub = {
      name       = "vm0-pub-ip"
      sku        = "Standard"
      allocation = "Static"
    }
  }
}

variable "vm1_pub_ip_config" {
  type = map(object({
    name       = string
    sku        = string
    allocation = string
  }))
  default = {
    vm1_pub = {
      name       = "vm1-pub-ip"
      sku        = "Standard"
      allocation = "Static"
    }
  }
}

variable "vm2_pub_ip_config" {
  type = map(object({
    name               = string
    sku                = string
    public_allocation  = string
    private_allocation = string
  }))
  default = {
    vm2_pub = {
      name               = "vm2-pub-ip"
      sku                = "Standard"
      public_allocation  = "Static"
      private_allocation = "Dynamic"
    }
  }
}

variable "vm3_pub_ip_config" {
  type = map(object({
    name               = string
    sku                = string
    public_allocation  = string
    private_allocation = string
  }))
  default = {
    vm3_pub = {
      name               = "vm3-pub-ip"
      sku                = "Standard"
      public_allocation  = "Static"
      private_allocation = "Dynamic"
    }
  }
}

// vm2 Configuration for(vnet2,- sub0)
variable "vm2_config" {
  type = map(object({
    vm_name     = string
    vm_nic_name = string
    size        = string
    admin_name  = string
    admin_pass  = string
  }))
  default = {
    vm2 = {
      vm_name     = "vm2"
      vm_nic_name = "vm2-nic"
      size        = "Standard_D2_v2"
      admin_name  = "kalleanka"
      admin_pass  = "kalleanka12345!"
    }
  }
}

// vm3 Configuration for(vnet3,- sub0)
variable "vm3_config" {
  type = map(object({
    vm_name     = string
    vm_nic_name = string
    size        = string
    admin_name  = string
    admin_pass  = string
  }))
  default = {
    vm3 = {
      vm_name     = "vm3"
      vm_nic_name = "vm3-nic"
      size        = "Standard_D2_v2"
      admin_name  = "kalleanka"
      admin_pass  = "kalleanka12345!"
    }
  }
}

variable "src_img_ref" {
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
  default = {
    source_vm = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2019-Datacenter"
      version   = "latest"
    }
  }
}

// Local Peering
variable "local_peering" {
  type        = list(string)
  description = "Names of the local peerings"
  default = [
    "Peered-Vnet1-Vnet2-Local",
    "Peered-Vnet2-Vnet1-Local",
    "Peered-Vnet1-Vnet3-Local",
    "Peered-Vnet3-Vnet1-Local",
  ]
}

// Routing between vnet2 - vnet3
variable "vn2_vn3_route" {
  type = map(object({
    route_name_table = string
    routing_prefix   = string
    next_hop         = string
    next_hop_address = string
    route_name       = string
  }))
  default = {
    vn2_vn3 = {
      route_name_table = "routing-vnet2-vnet3"
      route_name       = "route2-3"
      routing_prefix   = "10.63.0.0/22"
      next_hop         = "VirtualAppliance"
      next_hop_address = "10.60.0.4"
    }
  }
}

// Routing between vnet2 - vnet3
variable "vn3_vn2_route" {
  type = map(object({
    route_name_table = string
    routing_prefix   = string
    next_hop         = string
    next_hop_address = string
    route_name       = string
  }))
  default = {
    vn3_vn2 = {
      route_name_table = "routing-vnet3-vnet2"
      route_name       = "route3-2"
      routing_prefix   = "10.62.0.0/22"
      next_hop         = "VirtualAppliance"
      next_hop_address = "10.60.0.4"
    }
  }
}

// conf loadbalancer
variable "loadbalancer_config" {
  type = map(object({
    pub_ip_lb_name = string
    lb4_name       = string
    lb4_fe_name    = string
    lb4_be_name    = string
    alloca_method  = string
    sku            = string
  }))
  default = {
    lb1 = {
      pub_ip_lb_name = "az104-06-pip4"
      lb4_name       = "az104-06-lb4"
      lb4_fe_name    = "az104-06-lb4-fe"
      lb4_be_name    = "az104-06-lb4-be1"
      alloca_method  = "Static"
      sku            = "Standard"
    }
  }
}

// Public IPS SKU
variable "pub_ip_sku" {
  type        = list(string)
  description = "Choose between basic or standard sku"
  default     = ["Basic", "Standard"]
}

variable "app_gw_pubip_config" {
  type = map(object({
    name       = string
    allo_methd = string
  }))
  default = {
    app_gw1 = {
      name       = "az104-06-pip5"
      allo_methd = "Static"
    }
  }
}

// App-Gateway Subnet config
variable "app_gw_subnet" {
  type = map(object({
    sub_name  = string
    sub_range = string
  }))
  default = {
    app_gw_front1 = {
      sub_name  = "subnet-appgw"
      sub_range = "10.60.3.224/27"
    }
  }
}

// App-Gateway config
variable "app_gw1" {
  type = map(object({
    name = string
  }))
  default = {
    app_gw_1 = {
      name = "az104-06-appgw5"
    }
  }
}