variable "cluster_name" {
  type        = map
  description = "AKS Cluster name"
  default     = {
    "extnet-prd"  = "conn-extnet-shared-prd-aks",
    "extnet-devqas" = "conn-extnet-shared-devqas-aks",
    "ext-net-cmn-nginx" = "conn-extnet-shared-cmn-nginx-aks",
  	"intnet-prd" = "conn-intnet-shared-prd-aks",
    "intnet-devqas" = "conn-intnet-shared-devqas-aks",
	  "intnet-cmn-nginx" = "conn-intnet-shared-cmn-nginx-aks"
  }
}

variable "aks_infra_resource_group" {
  type        = map
  description = "Resource group name for AKS infra"
  default     = {
    "extnet-prd"  = "conn-extnet-shared-aks-infra-prd-rg",
    "extnet-devqas" = "conn-extnet-shared-aks-infra-devqas-rg",
    "ext-net-cmn-nginx" = "conn-extnet-shared-nginx-aks-infra-cmn-rg",
	  "intnet-prd" = "conn-intnet-shared-aks-infra-prd-rg",
    "intnet-devqas" = "conn-intnet-shared-aks-infra-devqas-rg",
	  "intnet-cmn-nginx" = "conn-intnet-shared-nginx-aks-infra-cmn-rg"
  }
}

variable "node_vm_size" {
  type        = map
  description = "Default virtual machine size for AKS node pool"
  default     = {
    "system-prd"  = "Standard_D4s_v5"
    "system-devqas" = "Standard_D2s_v5"
    "system-cmn-nginx" = "Standard_D4s_v5"
	  "user-prd" = "Standard_E4bs_v5"
    "user-devqas" = "Standard_E4bs_v5"
	  "user-cmn-nginx" = "Standard_E4bs_v5"	
  }
}

variable "vnet_subnet_id" {
  type        = map
  description = "vnet id for AKS environments"
  default     = {
    "extnet-prd"  = "/subscriptions/e2f05a33-aba2-4049-9296-6b075bdda75f/resourceGroups/conn-extnet-prd-rg/providers/Microsoft.Network/virtualNetworks/10.20.16.0_20-conn-extnet-prd-vnet/subnets/10.180.0.0_18-conn-extnet-aks-prd-sub",
    "extnet-devqas" = "/subscriptions/e2f05a33-aba2-4049-9296-6b075bdda75f/resourceGroups/conn-extnet-prd-rg/providers/Microsoft.Network/virtualNetworks/10.20.16.0_20-conn-extnet-prd-vnet/subnets/10.180.64.0_18-conn-extnet-aks-devqas-sub",
    "ext-net-cmn-nginx" = "/subscriptions/e2f05a33-aba2-4049-9296-6b075bdda75f/resourceGroups/conn-extnet-prd-rg/providers/Microsoft.Network/virtualNetworks/10.20.16.0_20-conn-extnet-prd-vnet/subnets/10.180.253.0_24-conn-extnet-nginx-aks-cmn-sub",
  	"intnet-prd" = "/subscriptions/e2f05a33-aba2-4049-9296-6b075bdda75f/resourceGroups/conn-intnet-prd-rg/providers/Microsoft.Network/virtualNetworks/10.20.32.0_20-conn-intnet-prd-vnet/subnets/10.181.0.0_18-conn-intnet-aks-prd-sub",
    "intnet-devqas" = "/subscriptions/e2f05a33-aba2-4049-9296-6b075bdda75f/resourceGroups/conn-intnet-prd-rg/providers/Microsoft.Network/virtualNetworks/10.20.32.0_20-conn-intnet-prd-vnet/subnets/10.181.64.0_18-conn-intnet-aks-devqas-sub",
	  "intnet-cmn-nginx" = "/subscriptions/e2f05a33-aba2-4049-9296-6b075bdda75f/resourceGroups/conn-intnet-prd-rg/providers/Microsoft.Network/virtualNetworks/10.20.32.0_20-conn-intnet-prd-vnet/subnets/10.181.253.0_24-conn-intnet-nginx-aks-cmn-sub"
  }
}

variable "max_pods" {
  type        = map
  description = "service ip range for AKS environments"
  default     = {
    "system-prd"  = 50
    "system-devqas" = 50
    "system-cmn-nginx" = 30
	  "user-prd" = 150
    "user-devqas" = 150
	  "user-cmn-nginx" = 50
  }
}

variable "service_cidrs" {
  type        = map
  description = "service ip range for AKS environments"
  default     = {
    "extnet-prd"  = "10.21.0.0/20",
    "extnet-devqas" = "10.21.16.0/20",
    "extnet-cmn-nginx" = "10.21.253.0/24",
	  "intnet-prd" = "10.21.32.0/20",
    "intnet-devqas" = "10.21.48.0/20",
	  "intnet-cmn-nginx" = "10.21.254.0/24"	
  }
}

variable "service_cidr_dns_ip" {
  type        = map
  description = "service dns ip for AKS environments"
  default     = {
    "extnet-prd"  = "10.21.0.10"
    "extnet-devqas" = "10.21.16.10"
    "ext-net-cmn-nginx" = "10.21.253.10"
	  "intnet-prd" = "10.21.32.10"
    "intnet-devqas" = "10.21.48.10"
	  "intnet-cmn-nginx" = "10.21.254.10"	
  }
}

### Authentication and Authorization(RBAC)
variable "rbac_aad_admin_group_object_ids" {
  type        = list(string)
  description = "AKS AAD admin group"
  default     = ["667b8ee8-8abc-4256-9b1c-d74a98bd1d3c"]
}

variable "tags" {
  type        = map
  description = "resource ang resource group attach tag"
  default     = {
    "01.호스트명"="aks",
    "02.회사명"="(주)대림",
    "03.운영형태"="운영",
	  "04.중요도"="상",
    "05.업무영역"="",
	  "06.적용업무"="",
    "07.인프라담당"="",
    "08.서비스담당자"="",
    "09.비고"=""
  }
}