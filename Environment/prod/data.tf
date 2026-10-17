# data "azurerm_subnet" "subnets" {
#   for_each             = var.subnets
#   name                 = each.value.name
#   virtual_network_name = each.value.virtual_network_name
#   resource_group_name  = each.value.resource_group_name
# }

# data "azurerm_network_security_group" "nsgs" {
#   for_each            = var.nsgs
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
# }

# data "azurerm_network_interface" "nics" {
#   for_each            = var.nics
#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
# }

# data "azurerm_public_ips" "pips" {
#   for_each            = var.bastion
#   resource_group_name = each.value.resource_group_name
#   attachment_status   = each.value.attachment_status
# }
