# 본 tf파일에서는 다음과 같은 모듈을 구성 지원합니다.
## VNet / Subnet / Route Table / / / / / / / / 

# VNet 모듈
resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags               = var.tags
}

# Subnet 모듈
resource "azurerm_subnet" "this" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_route_table" "this" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags               = var.tags
}

# Route Table 모듈
resource "azurerm_route" "route" {
  count                  = length(var.routes)
  name                   = var.routes[count.index].name
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.this.name
  address_prefix         = var.routes[count.index].address_prefix
  next_hop_type          = var.routes[count.index].next_hop_type
  next_hop_in_ip_address = try(var.routes[count.index].next_hop_in_ip_address, null)
}