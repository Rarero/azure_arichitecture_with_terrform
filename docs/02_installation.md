# Terraform 설치 및 기본 설정 (Mac)

## 1. Terraform이란?
Terraform은 HashiCorp에서 개발한 **Infrastructure as Code (IaC)** 도구로, 클라우드 인프라를 코드로 정의하고 자동화하는 데 사용됩니다.  
이 문서에서는 Mac에서 Terraform을 설치하고 기본적인 설정을 수행하는 방법을 설명합니다.

---

## 2. Terraform 설치 방법 (Mac)

### **1) Homebrew를 이용한 설치**
Homebrew를 사용하면 간단하게 Terraform을 설치할 수 있습니다.

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

설치가 완료되었는지 확인하려면 다음 명령어를 실행합니다.

```sh
terraform version
```

출력 예시:
```
Terraform v1.6.0
on darwin_amd64
```

✅ **이 방법을 추천하는 이유:**  
- Homebrew를 사용하면 손쉽게 버전 관리를 할 수 있음
- `brew upgrade terraform` 명령어로 최신 버전으로 업그레이드 가능

<br>

### **2) 직접 바이너리 다운로드 (수동 설치)**
Homebrew를 사용할 수 없는 경우, HashiCorp 공식 웹사이트에서 Terraform을 다운로드하여 설치할 수도 있습니다.

1. [Terraform 다운로드 페이지](https://developer.hashicorp.com/terraform/downloads)에 접속합니다.
2. `macOS` 버전에 맞는 `.zip` 파일을 다운로드합니다.
3. 터미널에서 압축을 해제하고 실행 파일을 `/usr/local/bin`에 복사합니다.
```sh
unzip terraform_*.zip
sudo mv terraform /usr/local/bin/
chmod +x /usr/local/bin/terraform
```

4. Terraform 버전 확인:
```sh
terraform version
```

<br>

## 3. Terraform 기본 설정

### **1) 자동 완성 기능 활성화**
Terraform CLI에서 자동 완성을 사용하려면 다음을 실행합니다.

```sh
terraform -install-autocomplete
```
이후 터미널을 다시 시작하면 자동 완성이 활성화됩니다.

<br>

### **2) Terraform 환경 변수 설정 (선택사항)**
Terraform 실행 경로를 환경 변수에 추가해야 하는 경우, 다음 명령을 실행합니다.

```sh
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

이제 어느 디렉토리에서든 `terraform` 명령을 실행할 수 있습니다.

<br>

## 4. Terraform 실행 테스트
설치가 정상적으로 완료되었는지 확인하려면 간단한 Terraform 명령어를 실행해 봅니다.

```sh
terraform init
```

Terraform이 정상적으로 실행되면, 출력 메시지에서 `Terraform has been successfully initialized!`를 확인할 수 있습니다.

<br>

## 5. Terraform 제거 방법
만약 Terraform을 제거해야 한다면, 다음 명령을 실행하면 됩니다.

```sh
brew uninstall terraform
```
또는 수동 설치한 경우:

```sh
sudo rm /usr/local/bin/terraform
```

<br>>

## 6. 참고 사이트
- [Terraform 공식 문서](https://developer.hashicorp.com/terraform/docs)
- [Homebrew 공식 사이트](https://brew.sh/)