module "azurerm_resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  source     = "../../Modules/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_subnets" {
  source     = "../../Modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.azurerm_virtual_network]
}

module "azurerm_network_interface" {
  source     = "../../Modules/azurerm_network_interface"
  nics       = var.nics
  depends_on = [module.azurerm_resource_group, module.azurerm_subnets]
}

module "azurerm_public_ip" {
  source     = "../../Modules/azurerm_public_ip"
  pips       = var.pips
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_network_security_group" {
  source     = "../../Modules/azurerm_network_security_group"
  nsgs       = var.nsgs
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_network_security_rule" {
  source     = "../../Modules/azurerm_network_security_rules"
  nsg_rules  = var.nsg_rules
  depends_on = [module.azurerm_resource_group, module.azurerm_network_security_group]
}

module "azurerm_subnet_network_security_group_association" {
  source                  = "../../Modules/azurerm_subnet_network_security_group_associaltion"
  subnet_nsg_associations = var.subnet_nsg_associations
  depends_on              = [module.azurerm_subnets, module.azurerm_network_security_group]
}

module "azurerm_bastion_host" {
  source     = "../../Modules/azurerm_bastion_host"
  bastion    = var.bastion
  depends_on = [module.azurerm_subnets]
}