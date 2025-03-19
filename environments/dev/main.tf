# 모듈 호출
module "vnet" {
  source              = "../../modules/networking/main.tf"
  vnet_name           = "dev-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags
}

module "subnet" {
  source              = "../../modules/networking/main.tf"
  subnet_name         = "dev-subnet"
  resource_group_name = var.resource_group_name
  vnet_name           = module.vnet.vnet_id
  address_prefixes    = ["10.0.1.0/24"]
}

module "route_table" {
  source              = "../../modules/networking/main.tf"
  route_table_name    = "dev-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  routes = [
    {
      name                   = "default-route"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.0.1.4"
    }
  ]
}