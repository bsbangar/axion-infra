data "azurerm_network_interface" "nics" {
  for_each            = var.nics
  name                = each.value.name_nics
  resource_group_name = each.value.resource_group_name
}