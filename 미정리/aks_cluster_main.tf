locals {
  network_prefix          = var.network_prefix
  environment_prefix      = var.environment_prefix
  kubernetes_version      = var.kubernetes_version
  subscription_id         = "e2f05a33-aba2-4049-9296-6b075bdda75f"
  tenant_id               = "eaa63d52-881c-488e-b96c-bc2d13ac803b"

  # 변수 처리.
  combined_prefix         = "${local.network_prefix}-${local.environment_prefix}"
  system_nodepool_prefix  = "system-${local.environment_prefix}"
  user_nodepool_prefix    = "user-${local.environment_prefix}"
}

### AKS resource group
data "azurerm_resource_group" "aks_rg" {
  name = "conn-net-shared-aks-cluster-cmn-rg"
}

### AKS informatoion && AKS default_node_pool (systempool)
resource "azurerm_kubernetes_cluster" "aks_cluster_default" {
  lifecycle {
    precondition {
      condition     = contains(["extnet", "intnet"], local.network_prefix)
      error_message = "The network_prefix must be either 'extnet' or 'intnet'."
    }
    precondition {
      condition     = contains(["prd", "devqas", "cmn-nginx"], local.environment_prefix)
      error_message = "The environment_prefix must be one of 'prd', 'devqas', or 'cmn-nginx'."
    }
  }

  name      					= var.cluster_name[local.combined_prefix]
  resource_group_name	= data.azurerm_resource_group.aks_rg.name
  location	    			= data.azurerm_resource_group.aks_rg.location
  dns_prefix		    	= "aks-${local.network_prefix}-${local.environment_prefix}"
  kubernetes_version	= local.kubernetes_version
  node_resource_group	= var.aks_infra_resource_group[local.combined_prefix]
  private_cluster_enabled	= true
  local_account_disabled	= true
  sku_tier            = "Standard"
  tags                = var.tags
  default_node_pool {
    name                = "systempool"
    vm_size             = var.node_vm_size[local.system_nodepool_prefix]
    #os_disk_size_gb     = 30
    vnet_subnet_id      = var.vnet_subnet_id[local.combined_prefix]
    enable_auto_scaling = true
    min_count           = 2
    max_count           = 3
    node_count          = 2
	  max_pods      			= var.max_pods[local.system_nodepool_prefix]
	  zones				        = ["1", "2", "3"]
  }

  network_profile {
    network_plugin		= "azure"
    network_policy		= "azure"
    service_cidr		  = var.service_cidrs[local.combined_prefix]
    dns_service_ip		= var.service_cidr_dns_ip[local.combined_prefix]
	  outbound_type		  = "userDefinedRouting"
    #docker_bridge_cidr = "172.17.0.1/16"
  }

  azure_active_directory_role_based_access_control {
    managed                 = true
    azure_rbac_enabled      = true
    tenant_id               = local.tenant_id
    admin_group_object_ids  = var.rbac_aad_admin_group_object_ids
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  automatic_channel_upgrade = null
  node_os_channel_upgrade = "None"
  oidc_issuer_enabled = true
}

### AKS Additional node pool (userpool)
resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  name = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster_default.id
  vm_size = var.node_vm_size[local.user_nodepool_prefix]
  mode = "User"
  enable_auto_scaling = true
  max_count = 3
  min_count = 2
  node_count = 2
  max_pods = var.max_pods[local.user_nodepool_prefix]
  zones				        = ["1", "2", "3"]
}

### AKS Role Assignment
data "azurerm_subscription" "primary" {
}

resource "azurerm_role_assignment" "User_Access" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "User Access Administrator"
  principal_id         = azurerm_kubernetes_cluster.aks_cluster_default.identity[0].principal_id
}

resource "azurerm_role_assignment" "Network_Contributor" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks_cluster_default.identity[0].principal_id
}

### AKS attach ACR 
# ACR resource group
data "azurerm_resource_group" "acr_rg" {
  name     = "conn-net-shared-acr-cmn-rg"
}

# ACR resources
data "azurerm_container_registry" "daelim_acr" {
  name                = "conn8net8dae8cmn8acr"
  resource_group_name = data.azurerm_resource_group.acr_rg.name
}

data "azurerm_container_registry" "dlchem_acr" {
  name                = "conn8net8chem8cmn8acr"
  resource_group_name = data.azurerm_resource_group.acr_rg.name
}

data "azurerm_container_registry" "dlcon_acr" {
  name                = "conn8net8con8cmn8acr"
  resource_group_name = data.azurerm_resource_group.acr_rg.name
}

# Attach ACR
resource "azurerm_role_assignment" "daelim_acr_role_assign" {
  scope                            = data.azurerm_container_registry.daelim_acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster_default.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "dlchem_acr_role_assign" {
  scope                            = data.azurerm_container_registry.dlchem_acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster_default.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "dlcon_acr_role_assign" {
  scope                            = data.azurerm_container_registry.dlcon_acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster_default.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}
