data "azurerm_subnet" "subnets" {
  for_each             = var.nics
  name                 = each.value.name_subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
