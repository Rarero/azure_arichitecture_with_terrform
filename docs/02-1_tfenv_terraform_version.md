# tfenv로 Terraform 버전 관리

## 1. tfenv란?
`tfenv`는 Terraform 버전을 쉽게 관리하고 전환할 수 있는 버전 관리 도구입니다.  
여러 프로젝트에서 다른 Terraform 버전을 사용해야 할 경우, `tfenv`를 사용하면 간편하게 원하는 버전을 설치하고 전환할 수 있습니다.

## 2. tfenv 설치 방법
### **tfenv 사용 전 기존 Terraform 제거**
`tfenv`는 Terraform과 함께 설치되지 않으며, 기존에 설치된 Terraform이 있을 경우 충돌이 발생할 수 있습니다.  
따라서 `tfenv`를 사용하기 전에 기존 Terraform을 제거하는 것이 좋습니다.

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
위 명령어를 실행했을 때 `"command not found"`가 출력되면 삭제가 완료된 것입니다.

### **MacOS (Homebrew 사용)**
```sh
brew install tfenv
```

### **Linux (Ubuntu/Debian)**
```sh
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 3. tfenv로 Terraform 다중 버전 관리
### **설치가능한 Terraform 버전 목록 조회**
```sh
tfenv list-remote
```
예시:
```sh
tfenv install 1.5.7
```
### **Terraform 버전 설치**
```sh
tfenv install <버전>
```
예시:
```sh
tfenv install 1.5.7
```

### **Terraform 버전 변경**
```sh
tfenv use <버전>
```
예시:
```sh
tfenv use 1.5.7
```

### **설치된 Terraform 버전 목록 확인**
```sh
tfenv list
```

### **기본 Terraform 버전 설정**
```sh
tfenv use <버전> --default
```
예시:
```sh
tfenv use 1.6.0 --default
```

## 4. 프로젝트별 Terraform 버전 지정
프로젝트 디렉토리에서 `.terraform-version` 파일을 생성하면, 해당 디렉토리에서 자동으로 지정한 버전이 적용됩니다.

```sh
echo "1.5.7" > .terraform-version
```

해당 디렉토리에서 `terraform version`을 실행하면 설정된 버전이 적용됨을 확인할 수 있습니다.

## 5. 참고 사이트
- [tfenv GitHub Repository](https://github.com/tfutils/tfenv)
- [Terraform 공식 문서](https://developer.hashicorp.com/terraform/docs)