# VNet 모듈에 대한 output
output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

# Subnet 모듈에 대한 output
output "subnet_id" {
  value = azurerm_subnet.this.id
}

# Route Table 모듈에 대한 output
output "route_table_id" {
  value = azurerm_route_table.this.id
}