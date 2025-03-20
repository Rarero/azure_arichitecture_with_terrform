terraform {
  # Terraform 버전 요구 사항을 정의
  required_version = ">= 1.3.0, < 1.12.0"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~>2.3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.13.0"
    }
  }
}

# 구독ID의 노출을 막기 위해 다음의 방법으로 인증 진행. 자세한 방식은 '참고사항.md' 참조
provider "azurerm" {
  features {}

}