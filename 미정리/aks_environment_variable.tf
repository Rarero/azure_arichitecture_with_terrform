variable "network_prefix" {
  type        = string
  description = "AKS Cluster 네트워크 위치 정보입니다. [extnet/intnet]만 기입이 가능합니다."
  default     = "extnet"
}

variable "environment_prefix" {
  type        = string
  description = "AKS Cluster 운영 환경 정보입니다. [prd/devqas/cmn-nginx]만 기입이 가능합니다."
  default     = "prd"
}

variable "kubernetes_version" {
  type        = string
  description = "AKS Cluster 버전입니다."
  default     = "1.27.7"
}