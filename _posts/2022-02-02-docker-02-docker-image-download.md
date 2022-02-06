---
layout: post
title: "[Docker] 설치부터 사용까지!_02(기초 - 이미지 받기)"
tags: 
  - Docker
categories:
  - Docker
---

## Intro
Docker의 기본적인 기능을 아라보자.

## 실행 환경
- WSL2 ubuntu LTS 20.04
- Docker 20.10.12

![image](https://user-images.githubusercontent.com/51642448/152668784-9f8103f9-6d13-467b-9b6d-9891fa332fae.png)

## Docker 사용하기

### 1. Docker 실행 
```bash
$ sudo dockerd
```
![image](https://user-images.githubusercontent.com/51642448/152669388-425f92fd-a42c-49e5-b51c-296fac82ce3b.png)
- 위 사진처럼 나오면 실행이 완료된 것이다. 현제 컨테이너가 실행되고 있지 않아서 다음과 같이 나온다.
<br/>

### 2. 이미지 목록 보기
```bash 
$ sudo docker images
```
<br/>

### 3. 이미지 검색
```bash
$ sudo docker search [이미지 이름]
```
![image](https://user-images.githubusercontent.com/51642448/152669469-d097c015-5721-46f9-bef1-d3f13c74da09.png)
  - ubuntu를 검색해본 화면이다. 
<br/>


### 4. 이미지 받기
```bash
$ sudo docker pull [이미지 이름]:[버전]
```
![image](https://user-images.githubusercontent.com/51642448/152669518-496b1e6c-6fb1-48e8-96e0-e993f11a3b9b.png)
- [버전]에 원하는 버전을 넣고 아무것도 넣지 않는다면 기본태그는 'lasted'로 들어가게 된다.

![image](https://user-images.githubusercontent.com/51642448/152669587-5d7f48da-cde5-461b-a3ae-34ffc5997ab4.png)
- sudo docker images를 통해 다운 받은 이미지를 확인 할 수 있다.

### 5. 이미지 삭제
```bash
$ sudo docker rmi [이미지 ID]
$ sudo docker rmi -f [이미지 ID] - -f는 강제 삭제 옵션이다.
```
![image](https://user-images.githubusercontent.com/51642448/152669764-5eaa04bd-5085-452b-b68a-dabf4df5342d.png)
- 이미지 ID는 IMAGE ID 부분에 '54c9d81cbb44'을 의미한다.
- [TIP] 삭제시 이미지 ID의 앞 3자리만 입력해도 삭제가 된다.