# VNet 모듈에 대한 변수
variable "vnet_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "address_space" { type = list(string) }
variable "tags" { type = map(string) }

# Subnet 모듈에 대한 변수
variable "subnet_name" { type = string }
variable "resource_group_name" { type = string }
variable "vnet_name" { type = string }
variable "address_prefixes" { type = list(string) }

# Route Table 모듈에 대한 변수
variable "route_table_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "tags" { type = map(string) }

variable "routes" {
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
}