# tfenv를 활용한 Terraform 버전 관리

Terraform의 버전 관리를 보다 효율적으로 하기 위해 `tfenv`를 사용할 수 있습니다.  
`tfenv`를 사용하면 여러 프로젝트에서 서로 다른 Terraform 버전을 쉽게 설치하고 전환할 수 있습니다.

<br>

## 1. tfenv란?

`tfenv`는 Terraform 버전을 쉽게 관리하고 전환할 수 있는 버전 관리 도구입니다.  
여러 프로젝트에서 다른 Terraform 버전을 사용해야 할 경우, `tfenv`를 활용하면 간편하게 원하는 버전을 설치하고 전환할 수 있습니다.

<br>

## 2. tfenv 설치 방법

### **tfenv 사용 전 기존 Terraform 제거**

`tfenv`는 기존에 설치된 Terraform과 함께 사용하면 충돌이 발생할 수 있으므로, 기존 Terraform을 제거하는 것이 좋습니다.

#### **MacOS (Homebrew로 설치한 경우)**

```sh
brew uninstall terraform
```


#### **Linux (수동 설치한 경우)**
```sh
sudo rm -f /usr/local/bin/terraform
```

Terraform이 정상적으로 제거되었는지 확인하려면:

```sh
terraform version
```
위 명령어 실행 시 `"command not found"`가 출력되면 삭제가 완료된 것입니다.

<br>

### **tfenv 설치 방법**

#### **MacOS (Homebrew 사용)**

```sh
brew install tfenv
```


#### **Linux (Ubuntu/Debian)**

```sh
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

<br>

## 3. Terraform 버전 관리

### **설치 가능한 Terraform 버전 목록 조회**

```sh
tfenv list-remote
```

### **Terraform 버전 설치**

```sh
tfenv install <버전>
```

### **Terraform 버전 변경**

```
tfenv use <버전>
```

### **설치된 Terraform 버전 목록 확인**

```
tfenv list
```

### **기본 Terraform 버전 설정**

```
tfenv use <버전> --default
```

<br>

## 4. 프로젝트별 Terraform 버전 지정

프로젝트 디렉토리에서 `.terraform-version` 파일을 생성하면, 해당 디렉토리에서 자동으로 지정한 버전이 적용됩니다.

```
echo "1.5.7" > .terraform-version
```

이후 해당 디렉토리에서 `terraform version`을 실행하면 설정된 버전이 적용됨을 확인할 수 있습니다.

<br>

## 5. 참고 사이트

- [tfenv GitHub Repository](https://github.com/tfutils/tfenv)
- [Terraform 공식 문서](https://developer.hashicorp.com/terraform/docs)