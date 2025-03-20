# VNet 모듈 (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
resource "azurerm_virtual_network" "vnet" {
  # 필수
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  location            = var.location

  # 선택
  tags                = var.tags
}