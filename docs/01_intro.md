# Terraform 개념 및 원리

## 1. Terraform이란?
Terraform은 HashiCorp에서 개발한 **Infrastructure as Code (IaC)** 도구로, 선언형 구문을 사용하여 인프라를 정의하고 관리할 수 있습니다.  
이를 통해 클라우드 및 온프레미스 환경에서 **반복 가능하고 일관된 인프라 배포**가 가능합니다.

Terraform은 **클라우드 제공업체(AWS, Azure, GCP 등)**뿐만 아니라 **온프레미스 인프라(VMware, OpenStack 등)**도 코드로 정의하여 관리할 수 있도록 지원합니다.

---

## 2. Terraform의 주요 개념
### **1) 선언형(Infrastructure as Code)**
- Terraform은 **선언형(Declarative) 코드 스타일**을 사용하여 인프라를 정의합니다.
- 사용자는 "무엇을 원하는지"를 코드로 정의하고, Terraform이 해당 상태를 자동으로 적용합니다.

### **2) 상태 관리 (State)**
- Terraform은 현재 인프라의 상태를 `.tfstate` 파일에 저장하여 **실제 배포된 인프라와 코드가 동기화되도록 유지**합니다.
- 이를 통해 변경 사항을 안전하게 관리할 수 있으며, 여러 사람이 협업할 때도 중요한 역할을 합니다.

### **3) 계획(Plan)과 적용(Apply)**
- `terraform plan`: 현재 코드와 상태를 비교하여 변경 사항을 미리 확인하는 명령어입니다.
- `terraform apply`: `plan`에서 확인된 변경 사항을 실제 인프라에 적용하는 명령어입니다.

### **4) 모듈(Module) 기반의 코드 재사용**
- **모듈(Module)** 을 사용하면 인프라 구성 요소를 **재사용 가능**한 블록으로 분리할 수 있습니다.
- 예를 들어, `network`, `compute`, `storage` 등의 모듈을 만들어 **일관된 인프라 배포**가 가능합니다.

---

## 3. Terraform의 동작 원리
Terraform은 다음 3단계로 동작합니다.

### **1) Init (`terraform init`)**
- Terraform이 사용할 Provider(예: Azure, AWS)를 다운로드하고, 현재 디렉토리를 초기화합니다.

### **2) Plan (`terraform plan`)**
- 현재 상태와 Terraform 코드 간의 차이를 분석하고, 실행될 변경 사항을 미리 보여줍니다.

### **3) Apply (`terraform apply`)**
- `plan`에서 생성된 변경 사항을 실제 인프라에 반영하여 리소스를 생성하거나 변경합니다.

---

## 4. Terraform을 사용하는 이유
✅ **자동화**: 수작업 없이 코드만으로 인프라를 배포하고 관리 가능  
✅ **일관성 유지**: 동일한 코드를 사용하여 여러 환경(Dev, Staging, Production)에서 일관된 인프라 구성 가능  
✅ **클라우드 간 호환성**: AWS, Azure, GCP 등 여러 클라우드 제공업체를 동시에 관리 가능  
✅ **버전 관리 가능**: Git과 같은 VCS를 사용하여 인프라 변경 사항을 추적 가능  

Terraform은 클라우드 인프라를 코드로 정의하고 관리하는 강력한 도구로, 현대 DevOps 및 SRE(사이트 안정성 엔지니어링) 환경에서 널리 사용되고 있습니다.

---

이제 Terraform의 기초 개념을 익혔으므로, 다음 단계에서 **설치 및 설정 방법**을 살펴보겠습니다.