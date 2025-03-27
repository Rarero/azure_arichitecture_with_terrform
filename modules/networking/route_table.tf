# Route Table 모듈 (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table)
# Route 모듈 (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route)
resource "azurerm_route_table" "route_table" {
  name                = var.route_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_route" "routes" {
  for_each = var.route_table_routes

  name                   = each.value.name
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.route_table.name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = try(each.value.next_hop_in_ip_address, null)
}
