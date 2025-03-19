# Terraform 베스트 프랙티스 정리

Terraform을 사용하여 인프라를 효율적으로 관리하려면 몇 가지 중요한 베스트 프랙티스를 따라야 합니다.  
이 문서에서는 Terraform의 유지보수성과 확장성을 높이기 위한 주요 전략을 정리합니다.

<br>

## 1. 코드 구조 및 모듈화

### **1.1. 모듈을 활용한 코드 재사용**
- 공통적으로 사용하는 리소스(VNet, Storage, Compute 등)를 **모듈(Module)** 로 분리하여 관리합니다.
- 모듈화를 통해 코드 재사용성을 높이고, 환경별 차이를 쉽게 관리할 수 있습니다.

#### ✅ 예제: `modules/networking/main.tf`
```hcl
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}
```

### **1.2. 환경별 구성 파일 분리**
- 개발(Dev), 스테이징(Staging), 운영(Prod) 환경별로 구성을 나누어 관리합니다.
- `environments/dev/`, `environments/staging/`, `environments/prod/` 폴더를 만들어 각각 다른 설정을 유지할 수 있도록 합니다.

<br>

## 2. 상태 관리 (Terraform State)

### **2.1. 원격 백엔드(Backend) 사용**
- `terraform.tfstate` 파일을 **로컬이 아닌 원격 저장소**(Azure Storage, S3, GCS 등)에 저장하여 협업을 원활하게 합니다.
- 원격 백엔드를 사용하면 여러 사용자가 동시에 `terraform apply`를 실행하는 문제를 방지할 수 있습니다.

#### ✅ 예제: `backend.tf`
```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "terraformstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

### **2.2. State 파일 잠금 기능 사용**
- 여러 사용자가 동시에 Terraform을 실행하면 충돌이 발생할 수 있으므로, **State Locking 기능을 활용하여 충돌을 방지**해야 합니다.
- 원격 백엔드 사용 시 대부분의 클라우드 저장소(Azure, AWS, GCP)는 잠금 기능을 지원합니다.

<br>

## 3. 변수 및 시크릿 관리

### **3.1. 변수 파일(`.tfvars`) 활용**
- 환경별 설정을 `.tfvars` 파일에 정의하여 유지보수성을 높입니다.
- 예제:
  ```hcl
  vnet_name = "my-vnet"
  location  = "eastus"
  ```

### **3.2. 시크릿 정보는 직접 코드에 포함하지 않기**
- `terraform.tfvars`에 API 키, 패스워드 등 민감한 정보를 저장하지 않습니다.
- **Azure Key Vault** 또는 **환경 변수**를 활용하여 시크릿을 안전하게 관리합니다.

#### ✅ 예제: 환경 변수를 이용한 시크릿 관리
```sh
export TF_VAR_client_secret="your-secret-key"
```

<br>

## 4. 코드 리뷰 및 CI/CD 적용

### **4.1. Terraform 코드 리뷰 진행**
- Terraform 변경 사항을 적용하기 전에 Pull Request(PR)를 통해 리뷰를 거치는 것이 중요합니다.
- `terraform plan` 결과를 공유하고, 코드 변경이 안전한지 검토합니다.

### **4.2. CI/CD 파이프라인에서 자동 검증**
- GitHub Actions, Azure DevOps 등을 활용하여 `terraform plan`을 자동 실행하고 코드의 유효성을 검증합니다.

#### ✅ 예제: GitHub Actions을 이용한 Terraform 검증
```yaml
jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2

      - name: Terraform Init
        run: terraform init

      - name: Terraform Validate
        run: terraform validate

      - name: Terraform Plan
        run: terraform plan -input=false
```

<br>

## 5. 모니터링 및 로깅

### **5.1. Terraform Audit Log 설정**
- Terraform이 수행한 변경 사항을 추적할 수 있도록 로깅을 활성화해야 합니다.
- Azure의 **Activity Log** 또는 AWS의 **CloudTrail**을 이용하여 변경 이력을 저장합니다.

### **5.2. Terraform 변경 로그 남기기**
- `terraform apply` 실행 전에 변경 사항을 기록하여, 문제가 발생했을 때 빠르게 롤백할 수 있도록 합니다.

<br>

## 6. 베스트 프랙티스 요약

✅ 모듈화를 통해 코드 재사용성을 높이고 환경별 설정을 분리  
✅ Terraform State를 원격 저장소(Azure Storage 등)에 저장하여 협업 강화  
✅ 민감한 정보(API 키 등)는 직접 코드에 포함하지 않고 환경 변수 또는 Key Vault 활용  
✅ CI/CD 파이프라인을 구축하여 `terraform plan` 결과를 자동 검증  
✅ Terraform 실행 로그를 기록하여 변경 사항을 추적 가능하도록 설정  

Terraform을 효과적으로 활용하기 위해 위의 베스트 프랙티스를 적용하는 것이 중요합니다.