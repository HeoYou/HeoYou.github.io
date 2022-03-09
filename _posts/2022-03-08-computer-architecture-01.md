---
layout: post
title: "[컴퓨터 구조] Computer-Architecture_01 컴퓨터시스탬 개요"
tags: 
categories:
  - Computer Architecture
---

## 컴퓨터의 기본 구조

### 컴퓨터 시스템 기본 구성

- 응용 소프트웨어(application software)
- 시스템 소프트웨어(system software)
- 하드웨어(hardware)

#### 하드웨어

- 컴퓨터의 물리적 부품
- 입력, 연산, 제어, 기억, 출력 기능 구현

#### 컴퓨터 하드웨어의 주요 구성 요소
1. 디스플레이
2. 메인보드(main board)
3. CPU
4. 주기억장치(main memory module)
5. 확장 보드(expansion board)
6. 전원 공급 장치(power supply)
7. 광 저장 장치(optical storage device)
8. 하드 디스크, SSD 등
9. 키보드
10. 마우스

#### 소프트 웨어
- 정보처리의 종류와 수행시간을 지정해주는 명령들의 집합
- 저장장치에 저장된 특정한 목적의 하나 또는 다수의 컴퓨터 프로그램
- 시스템 소프트웨어, 응용 소프트웨어
- 하드웨어에 의존적

#### 컴퓨터의 기본 구조
![image](https://user-images.githubusercontent.com/51642448/157457280-f2b3bed8-50f6-4ab5-9899-b68a031161a4.png)


## 정보 표현과 저장

### 컴퓨터 정보의 종류

- 프로그램 코드(program code)
- 데이터(data)
  - 2진수 비트(bit)들의 조합으로 표현

### 프로그램 코드(program code)

- 고급 언어 프로그램(high=level language)
- 어셈블리 프로그램(assembly program)
- 기계어(machine language)

### 컴파일러(compiler)
- 고급 언어 프로그램을 기계어로 변환해주는 소프트웨어
- 언어 번역 프로그램
- 해석기, 번역기

![image](https://user-images.githubusercontent.com/51642448/157458022-ea9636ea-b3f5-4c89-80fb-b2575cd0b9fb.png)

### 고급 언어에서 기계어 프로그램으로 번역
![image](https://user-images.githubusercontent.com/51642448/157458777-bc68ef6c-24b8-4d7e-abd8-08a1d0b23fab.png)

### 명령어 형식(instruction format)
- 명령어의 비트 수와 용도 및 필드 구성 방법을 지정해주는 형식
- 연산코드 필드(operation code field)
  - CPU가 수행할 연산을 지정
- 오퍼랜드 필드(operand field)
  - 명령어 실행에 필요한 데이터가 저장된 주소

![image](https://user-images.githubusercontent.com/51642448/157459861-868fa6c9-4a22-44ab-9f9f-dda5cd265913.png)