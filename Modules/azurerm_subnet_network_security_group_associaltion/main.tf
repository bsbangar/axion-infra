resource "azurerm_subnet_network_security_group_association" "subnet_nsg_associations" {
  for_each                  = var.subnet_nsg_associations
  subnet_id                 = data.azurerm_subnet.subnets[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsgs[each.key].id
}
