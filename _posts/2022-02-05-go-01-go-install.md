---
layout: post
title: "[GOLANG] GO 설치부터 사용까지_01(설치부터 환경변수 설정까지) !"
tags: 
  - install
  - windows10
categories:
  - go 
---

## Intro
GO를 다뤄보자!

## 설치 환경
- windows10

## 설치

### 1. go 홈페이지에 들어가자! [[홈페이지로]][go-home]

![image](https://user-images.githubusercontent.com/51642448/152995306-c1adb877-c07f-42c3-90ae-fa15779cd68c.png)

다운로드가 대문짝만하게 보입니다. 다운로드 클릭

### 2. 자신이 원하는 버전 또는 os버전을 골라 다운로드 합니다.

![image](https://user-images.githubusercontent.com/51642448/152995899-87ea16c2-fa2a-4437-afe7-29bb58ea45f9.png)

저는 개인적으로 설치형태보다는 압축형태로 다운로드해서 사용하는걸 좋아합니다. 
<br/>
그래서 zip파일인 아래에서 두번째 파일을 다운로드 하겠습니다. 
<br/>

![image](https://user-images.githubusercontent.com/51642448/152996602-bc5a8244-04f0-486d-bd80-c6edea119c07.png)

원하는 경로에 다운로드 후 압축을 풀어줍니다.

### 3. 환경설정

![image](https://user-images.githubusercontent.com/51642448/152997711-e32dad5a-7e90-41f9-aabb-61008e9cc2fa.png)

내 PC -> 속성 -> 고급 시스템 설정 -> 고급 탭 -> 환경 변수 들어가면 위와같은 화면이 나옵니다.

![image](https://user-images.githubusercontent.com/51642448/152998113-a354ef57-fdd8-490e-940e-232e16111aa6.png)

시스템 변수 -> 새로 만들기 클릭
<br/>
변수이름에 'GOROOT'적고 변수 값에 본인이 다운로드한 go의 경로를 입력합니다.(압축을 풀어준 상태)

**---한번 더---**

![image](https://user-images.githubusercontent.com/51642448/152998615-8bf10a2a-846f-4bf1-bd7f-ccad1598180d.png)

시스템 변수 -> 새로 만들기 클릭
<br/>
변수이름에 'GOPATH'적고 변수 값에 본인이 설정한 GOPATH의 경로를 입력합니다.(GOPATH는 제가 원하는 경로로 따로 만들어 두었습니다.)


### 4. 설치 확인

커멘드 창에 들어갑니다. 다음 명령어를 입력합니다. 
```
go version
```

![image](https://user-images.githubusercontent.com/51642448/152998944-4fcfc6fb-6c34-4c18-bd9a-ac3ab45d75cd.png)

버전이 나오는 것을 확인할 수 있습니다.

```
go env
```
위 명령어 입력 시 수정한 GOPATH도 확인할 수 있습니다.

![image](https://user-images.githubusercontent.com/51642448/152999363-2d54e57d-1b2e-416a-8a9d-c358e4f2f0de.png)


[go-home]: https://go.dev/