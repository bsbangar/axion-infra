data "azurerm_subnet" "subnets" {
  for_each             = var.bastion
  name                 = each.value.name_subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ips" "pips" {
  for_each            = var.bastion
  resource_group_name = each.value.resource_group_name
  attachment_status   = each.value.attachment_status
}
