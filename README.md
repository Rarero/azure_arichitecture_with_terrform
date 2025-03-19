# Terraform을 활용한 Azure 인프라 구축 및 관리

## 1. 개요
이 문서는 Terraform을 사용하여 Azure 인프라를 **멱등성 있게 배포**하고 **효율적으로 관리**하는 방법을 설명합니다.  
Terraform을 활용하면 인프라를 코드(IaC, Infrastructure as Code)로 정의하여 자동화된 배포 및 일관된 운영 관리를 수행할 수 있습니다.  
이를 통해 인프라 변경 사항을 추적하고, 확장성을 고려한 안정적인 환경을 구축할 수 있습니다.

<br>

## 2. 목적
본 문서의 주요 목표는 다음과 같습니다.

1. **Terraform을 이용한 Azure 인프라 배포**  
   - 코드 기반으로 Azure 자원을 선언적으로 정의하고 배포  
   - 멱등성을 보장하여 반복 실행 시 동일한 결과 유지  

2. **배포된 Azure 인프라의 지속적인 관리 및 업데이트**  
   - 인프라 변경 사항을 코드 수준에서 관리하고 적용  
   - Terraform의 상태 관리 기능을 활용하여 안정적인 업데이트 수행  

3. **IaC 기술 및 Azure 아키텍처에 대한 이해도 향상**  
   - Terraform을 활용한 인프라 관리 원칙 및 베스트 프랙티스 학습  
   - Azure 서비스 간의 관계 및 아키텍처 설계 능력 배양  

<br>

## 3. Repository 구조
```plaintext
azure_architecture_with_terraform/
├── docs/                     # 문서 관련 파일
│   ├── 01_intro.md           # Terraform 개념 및 원리 설명
│   ├── 02_installation.md    # Terraform 설치 및 기본 설정 (Mac)
│   ├── 02-1_tfenv_terraform_version.md  # tfenv 설치 및 Terraform 버전 관리
│   ├── 03_best_practices.md  # Terraform 베스트 프랙티스 정리
├── environments/             # 배포 환경별 구성
│   ├── dev/                  # 개발 환경
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   ├── outputs.tf
│   ├── staging/              # 스테이징 환경
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   ├── outputs.tf
│   ├── prod/                 # 운영 환경
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       ├── outputs.tf
├── modules/                  # 재사용 가능한 Terraform 모듈
│   ├── networking/           # 네트워크 관련 모듈 (VNet, Subnet 등)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── compute/              # 가상 머신, AKS, App Service 관련 모듈
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── storage/              # 스토리지 관련 모듈 (Blob, File Share 등)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
├── scripts/                  # 스크립트 파일 저장 (필요 시)
│   ├── bootstrap.sh          # 초기 설정 스크립트
│   ├── cleanup.sh            # 리소스 정리 스크립트
├── .github/                  # GitHub Actions (CI/CD 파이프라인 설정)
│   ├── workflows/
│   │   ├── terraform-ci.yml  # Terraform Plan/Apply 자동화
├── .gitignore                # Git 제외 파일 설정
├── README.md                 # 프로젝트 개요 및 설명
├── backend.tf                # Terraform backend (예: Azure Storage)
├── providers.tf              # Terraform provider 설정 (Azure)
└── versions.tf               # Terraform 버전 및 provider 버전 관리
```

<br>

## 4. Terraform 버전 관리

Terraform 버전 관리는 프로젝트의 배포 방식에 따라 다르게 접근할 수 있습니다.

- **단일 배포 형식으로 버전 관리가 필요 없는 경우**: [Terraform 설치 및 기본 설정](docs/02_installation.md) 문서를 참고하세요.
- **여러 프로젝트에서 다양한 Terraform 버전을 관리해야 하는 경우**: [tfenv로 Terraform 버전 관리](docs/02-1_tfenv_terraform_version.md) 문서를 참고하세요.

`tfenv`를 사용하면 여러 프로젝트에서 서로 다른 Terraform 버전을 쉽게 설치하고 전환할 수 있습니다.

<br>

## 5. 참고 사이트
- [tfenv GitHub Repository](https://github.com/tfutils/tfenv)
- [Terraform 공식 문서](https://developer.hashicorp.com/terraform/docs)
- [Terraform Azure Resource Manager (ARM) Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)