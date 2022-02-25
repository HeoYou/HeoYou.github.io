---
layout: post
title: "[docker-compose] 설치부터 사용까지_01(설치)"
tags: 
  - Docker
  - container
  - docker compose
categories:
  - Docker
  
---

## Intro
Docker compose는 복잡한 명령어를 편리하게 관리하도록 도와준다. 
<br/>
그래서 설치해 보았다.

## 설치 환경
- WSL2 ubuntu LTS 20.04
- Docker 20.10.12 [[설치하러 가기]][docker-install]


## Docker compose 설치하기

### 1. 다운로드
```bash
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
- 도커 컴포즈 설치(버전 수정이 가능하다)[[버전 확인하러 가기]][docker-compose-version-check]

### 2. 실행 권한 적용
```bash
$ chmod +x /usr/local/bin/docker-compose
```

### 3. 심볼릭 링크 설정
```bash
$ ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

### 4. 설치 확인
```bash
$ docker-compose --version
```

![image](https://user-images.githubusercontent.com/51642448/152796338-af762243-7e5a-4b2d-8a52-d09de2f6a8c0.png)


[docker-install]: https://heoyou.github.io/docker/2022/02/02/docker-01-docker-install.html
[docker-compose-version-check]: https://github.com/docker/compose/releases
