# Terraform을 활용한 Azure 인프라 구축 및 관리

## 1. 개요
이 문서는 Terraform을 사용하여 Azure 인프라를 멱등성 있게 배포하고 효율적으로 관리하기 위한 방법을 설명합니다.  
Terraform을 활용하면 인프라를 코드(IaC, Infrastructure as Code)로 정의하여 자동화된 배포 및 일관된 운영 관리를 수행할 수 있습니다.  
이를 통해 인프라 변경 사항을 추적하고, 확장성을 고려한 안정적인 환경을 구축할 수 있습니다.

## 2. 목적
본 문서의 주요 목표는 다음과 같습니다.

1. **Terraform을 이용한 Azure 인프라 배포**  
   - 코드 기반으로 Azure 자원을 선언적으로 정의하고 배포  
   - 멱등성을 보장하여 반복 실행 시 동일한 결과 유지  

2. **배포된 Azure 인프라의 지속적인 관리 및 업데이트**  
   - 인프라 변경 사항을 코드 수준에서 관리하고 적용  
   - Terraform의 상태 관리 기능을 활용하여 안정적인 업데이트 수행  

3. **IaC 기술 및 Azure 아키텍처에 대한 이해도 향상**  
   - Terraform을 통한 인프라 관리 원칙 및 베스트 프랙티스 학습  
   - Azure 서비스 간의 관계 및 아키텍처 설계 능력 배양  

## 3. 참고 사이트
- [Terraform Azure Resource Manager (ARM) Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- 