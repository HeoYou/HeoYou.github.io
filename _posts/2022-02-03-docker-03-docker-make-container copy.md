---
layout: post
title: "[Docker] 설치부터 사용까지!_03(기초 - container 활용하기)"
tags: 
  - container
categories:
  - Docker
  
---

## Intro
Docker의 기본적인 기능을 아라보자.

## 실행 환경
- WSL2 ubuntu LTS 20.04
- Docker 20.10.12 

![image](https://user-images.githubusercontent.com/51642448/152668784-9f8103f9-6d13-467b-9b6d-9891fa332fae.png)

## Docker container 활용하기

### 1. Docker Image 준비하기
학습을 위해 ubuntu 18.04 이미지를 다운로드 하겠습니다.
```bash
$ sudo docker pull ubuntu:18.04
```
![image](https://user-images.githubusercontent.com/51642448/152669866-ed2bda96-11b8-4c21-aed0-9f1d14af0701.png)
- ubuntu 18.04버전이 다운로드 된 것을 확인 할 수 있습니다.
<br/><br/>

### 2. Container 명령어
1. docker run
  - 컨테이너를 실행시키는 명령어 입니다.
  <br/><br/>

    |옵션|설명|
    |:---:|---|
    |-i|-t와 같이 사용해야 합니다. 표준입력을 활성화시키며 컨테이너와<br/> 연결되어있지 않더라도 표준입력을 유지합니다.|
    |-t|-i옵션과 같이 사용해야 합니다. TTY모드로 사용하며 bash를 사용하기 <br/>위해서는 꼭 필요합니다.|
    |-d|컨테이너를 백그라운드 모드로 실행, ps명령어로 실행되는지 확인할 수 있습니다.|
    |-p|컨테이너 포트를 호스트와 연결합니다.|
    |-----name|컨테이너의 이름을 설정합니다.|
    |-e|컨테이너의 환경변수를 설정할 수 있습니다.|
    |-v|컨테이너의 볼륨(volumn) 설정을 위해 사용됩니다.|
    |-----rm|컨테이너 정지 시 자동 삭제합니다.|
  
    <br/>

2. docker ps
  - 컨테이너의 정보를 볼 수 있습니다.
  <br/><br/>

    |옵션|설명|
    |:---:|---|
    |-a|모든 컨테이너의 정보를 출력한니다.|
    |-f|컨테이너 리스트를 필터링하여 출력합니다.|
    |-l|마지막에 만든 컨테이너를 출력합니다.|
    |-q|컨테이터의 ID만 출력합니다.|
    |-s|컨테이너의 사이즈를 출력합니다.|

    <br/>

3. docker start
  - 컨테이너를 실행시킵니다.
  <br/><br/>

4. docker stop
  - 컨테이너를 중지시킵니다.
  <br/><br/>

5. docker attach
  - 실행중인 컨테이너에 연결합니다.
  <br/><br/>

6. docker restart
  - 컨테이너를 재실행합니다.
  <br/><br/>

### 3. Container 만들기
이미지를 실행시켜 컨테이너로 만들기 위해서는 'run'옵션을 활용합니다. 
<br/>
```bash
$ sudo docker run [option] [image[:tag]] [COMMAND] [ARG...]
```
- 기본적인 사용법
<br/>

#### 직접 해보기
![image](https://user-images.githubusercontent.com/51642448/152674678-56864c7d-8dd6-4e32-adde-61368609dcc4.png)

```bash
$ sudo docker images
$ sudo docker run -it --name ubuntu18 ubuntu:18.04 /bin/bash
```
- docker images를 이용하여 이미지의 정보를 확인
- 순서대로 -it옵션, 이름 ubunut18, 이미지 ubuntu, 이미지 태그 18.04, /bin/bash 명령어입니다.
- 컨테이너 내부에 접속해 ubuntu 버전을 확인한 모습을 볼 수 있습니다.

<br/>

**[TIP]** 이미지 이름과 태그를 넣지않고 IMAGE ID를 이용할 수 있다.
```bash
$ sudo docker run -it --name ubuntu18 dcf /bin/bash
```

**[INFO]** -----name 다음엔 공백과 =가 모두 같은 동작을 한다
```bash
$ sudo docker run -it --name=ubuntu18 dcf /bin/bash
$ sudo docker run -it --name ubuntu18 dcf /bin/bash
```

#### Contaier에서 나가기
컨테이너에서 나가는 방법은 여러개 있습니다.
1. ctrl + p + q
2. exit 입력
3. 강제 종료

exit 또는 강제 종료를 할 경우 컨테이너가 중단됩니다.
<br/>
컨테이너를 종료시키지 않으려면 ctrl + p + q를 사용해야합니다.
<br/><br/>

### 4. Container 확인
생성한 컨테이너에서 나와서 만들어진 컨테이너를 확인해 보겠습니다. 
```bash
$ sudo docker ps -a
```
모든 컨테이너를 확인하기 위해 -a옵션을 붙여주었습니다. 
<br/><br/>

![image](https://user-images.githubusercontent.com/51642448/152675831-de3c3fca-47ec-491b-8c26-6a31e8831999.png)
컨테이너에서 ctrl + p + q를 이용하여 빠져나왔기 때문에 아직 컨테이너가 중지되지 않았습니다.


![image](https://user-images.githubusercontent.com/51642448/152675911-542f4523-d068-4d4b-b7bb-2dd967861533.png)
exit를 사용하여 빠져나오게 되면 컨테이너가 중지됩니다. 


### 5. Container 실행

죽어있는 컨테이너를 실행시키겠습니다.
```bash
$ sudo docker start 998
or
$ sudo docker start ubuntu18
```
명령어중 마지막 인자 CONTAINER ID 또는 NAMES중 편하신거 이용하시면됩니다.

![image](https://user-images.githubusercontent.com/51642448/152676104-ac061385-9a44-41c6-b070-50ec2933f1af.png)

### 6. Container 접속

attach 명령어 또는 exec 명령어를 사용해 들어갑니다.
```bash
$ sudo docker attach 998
or
$ sudo docker exec -it 998 /bin/bash
```
attach와 다르게 exec는 다양한 옵션을 사용할 수 있습니다. (나중에 정리)

### 7. Container 중지

stop 명령어를 사용합니다.
```bash
$ sudo docker stop 998
```

### 8. Container 삭제

rm 명령어를 이용합니다. -f옵션을 넣어주면 실행중인 컨테이너도 삭제가 가능합니다
![image](https://user-images.githubusercontent.com/51642448/152676374-d612900a-cfee-47b4-8fdf-f43973e91e5a.png)
실행중인 컨테이너를 삭제하려고 하였으나 삭제가 안되어 -f 옵션을 넣어 삭제 했습니다.