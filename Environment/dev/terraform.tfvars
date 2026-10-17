rgs = {
  rg1 = {
    name     = "rg-axion"
    location = "Australia East"
  }

}

vnets = {
  vnet1 = {
    name                = "network-axion"
    location            = "Australia East"
    resource_group_name = "rg-axion"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet-axion"
    virtual_network_name = "network-axion"
    resource_group_name  = "rg-axion"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet2 = {
    name                 = "backtend-subnet-axion"
    virtual_network_name = "network-axion"
    resource_group_name  = "rg-axion"
    address_prefixes     = ["10.1.2.0/24"]
  }
  subnet3 = {
    name                 = "database-subnet-axion"
    virtual_network_name = "network-axion"
    resource_group_name  = "rg-axion"
    address_prefixes     = ["10.1.3.0/24"]
  }
  subnet4 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "network-axion"
    resource_group_name  = "rg-axion"
    address_prefixes     = ["10.1.4.0/24"]
  }
}

nics = {
  nic1 = {
    name                          = "frontend-vm01"
    location                      = "Australia East"
    resource_group_name           = "rg-axion"
    nameipconfig                  = "internal"
    name_subnet                   = "frontend-subnet-axion"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "network-axion"

  }
  nic2 = {
    name                          = "backend-vm01"
    location                      = "Australia East"
    resource_group_name           = "rg-axion"
    nameipconfig                  = "internal"
    name_subnet                   = "backend-subnet-axion"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "network-axion"

  }
  nic3 = {
    name                          = "database-vm01"
    location                      = "Australia East"
    resource_group_name           = "rg-axion"
    nameipconfig                  = "internal"
    name_subnet                   = "database-subnet-axion"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "network-axion"

  }
}

pips = {
  pip1 = {
    name                = "pip-frontend-vm01"
    location            = "Australia East"
    resource_group_name = "rg-axion"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "pip-backend-vm01"
    location            = "Australia East"
    resource_group_name = "rg-axion"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip3 = {
    name                = "pip-database-vm01"
    location            = "Australia East"
    resource_group_name = "rg-axion"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip4 = {
    name                = "pip-bastion"
    location            = "Australia East"
    resource_group_name = "rg-axion"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nsgs = {
  nsg1 = {
    name                = "nsg-frontend"
    location            = "Australia East"
    resource_group_name = "rg-axion"
  }
  nsg2 = {
    name                = "nsg-backend"
    location            = "Australia East"
    resource_group_name = "rg-axion"
  }
  nsg3 = {
    name                = "nsg-database"
    location            = "Australia East"
    resource_group_name = "rg-axion"
  }
}

nsg_rules = {
  nsg_rules1 = {
    name                        = "SSH"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "rg-axion"
    network_security_group_name = "nsg-frontend"
  }
  nsg_rules2 = {
    name                        = "SSH"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "rg-axion"
    network_security_group_name = "nsg-backend"
  }
  nsg_rules3 = {
    name                        = "SSH"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "rg-axion"
    network_security_group_name = "nsg-database"
  }
}

subnet_nsg_associations = {
  association1 = {
    name_subnet          = "frontend-subnet-axion"
    virtual_network_name = "network-axion"
    resource_group_name  = "rg-axion"
    name_nsg             = "nsg-frontend"
  }

  association2 = {
    name_subnet          = "backend-subnet-axion"
    virtual_network_name = "network-axion"
    resource_group_name  = "rg-axion"
    name_nsg             = "nsg-backend"
  }

  association3 = {
    name_subnet          = "database-subnet-axion"
    virtual_network_name = "network-axion"
    resource_group_name  = "rg-axion"
    name_nsg             = "nsg-database"
  }
}

vms = {
  vm1 = {
    name                            = "frontend-vm01"
    resource_group_name             = "rg-axion"
    location                        = "Australia East"
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    admin_password                  = "P@ssword@13"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}

bastion = {
  bastion1 = {
    name                 = "AzureBastion"
    location             = "Australia East"
    resource_group_name  = "rg-axion"
    name_config          = "configuration"
    name_subnet          = "AzureBastionSubnet"
    virtual_network_name = "network-axion"
    attachment_status    = "attached"

  }
}
