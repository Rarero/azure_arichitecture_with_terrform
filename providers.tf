terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.85.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "azurerm" {
  features {}

  client_id         = "7a0a9b37-42e7-4a79-91e7-11ad79ee46fd"
  subscription_id   = "e2f05a33-aba2-4049-9296-6b075bdda75f"
  tenant_id         = "eaa63d52-881c-488e-b96c-bc2d13ac803b"
  client_secret     = "ZV~8Q~oo~.1fQr-6mBC.uTvCmF4Von7K2Ffb3drN"
}