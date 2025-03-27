# ========================
# COMMON VARIABLES
# ========================
variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed."
  default     = "koreacentral"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where resources will be created."
  default     = "default-rg"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to all resources."
  default     = { 
    environment = "dev"
    managed_by  = "terraform"
  }
}

# ========================
# VIRTUAL NETWORK MODULE
# ========================
variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network (VNet)."
  default     = "vnet_name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
  default     = ["10.0.0.0/16"]
}

# ========================
# SUBNET MODULE
# ========================
variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
  description = "Map of subnets to create in the Virtual Network, keyed by subnet name."
  default = {
    subnet-1 = {
      name             = "subnet-1"
      address_prefixes = ["10.0.1.0/24"]
    },
    subnet-2 = {
      name             = "subnet-2"
      address_prefixes = ["10.0.2.0/24"]
    }
  }
}

# ========================
# ROUTE TABLE MODULE
# ========================
variable "route_name" {
  type        = string
  description = "The name of the Route Table."
  default     = "default-rt"
}

variable "route_table_routes" {
  type = map(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  description = "Map of routes to configure within the Route Table, keyed by route name."

  default = {
    route1 = {
      name                   = "route1"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "Internet"
      next_hop_in_ip_address = null
    },
    route2 = {
      name                   = "route2"
      address_prefix         = "10.0.0.0/16"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.0.0.4"
    }
  }
}
