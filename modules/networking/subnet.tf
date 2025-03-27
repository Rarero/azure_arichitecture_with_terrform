# Subnet 모듈 (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#delegation-3)
resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  # 필수
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = each.value.address_prefixes
}