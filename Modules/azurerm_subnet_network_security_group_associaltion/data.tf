data "azurerm_subnet" "subnets" {
  for_each             = var.subnet_nsg_associations
  name                 = each.value.name_subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsgs" {
  for_each            = var.subnet_nsg_associations
  name                = each.value.name_nsg
  resource_group_name = each.value.resource_group_name
}

