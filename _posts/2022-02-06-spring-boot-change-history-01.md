---
layout: post
title: "[SPRING BOOT] 스프링 부트의 버전별 변천사_01(V.01 vs V.02)"
tags: 
  - Change history
categories:
  - Spring boot 
---

## Intro
Spring boot의 버전별 변천사를 아라보자

### 주요 변경사항 체크하는 경로

- [Spring Official Blog](https://spring.io/blog/category/releases)
- [Spring Boot Github](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.0-Release-Notes)
- [SpringOne Platform Presentation, 2017](https://youtu.be/TasMZsZxLCA)
- [Baeldung](https://www.baeldung.com/new-spring-boot-2)
- [Quora](Quora)
- [StackOverflow](https://stackoverflow.com/)


### 주요 변경 사항

  1. **Java 8 (+Java 9) + Spring Framework 5**
     1. Java 8 이 최소사양입니다.
     2. boot v.1은 Java8 이하의 버전도 사용 가능했다.
     3. Spring Framework 5를 사용한다.

  2. **써드파티 라이브러리 업그레이드**
     1. Tomcat 8.5
        - embedded tomcat 버전 8.5가 들어간다.
     2. Flyway 5 
     3. Hibernate 5.2 
     4. Thymeleaf 3 
        - Thymeleaf 2 에서 3으로 올라갔음. 기존에 3을 쓰려면 작업을 따로 해주어야했음. 
     5. Elasticsearch 5.6 
     6. Gradle 4 
     7. Jetty 9.4 
     8. Mockito 2.x

  3. **Reactive Spring(따로 정리해봐야 겠다.)**
     1. 무엇을 위해 존재하는가?
        - 한정된 자원(thread pool) 으로 비동기(asynchronous) 넌블럭킹(non-blocking) 알고리즘을 이용해 다수의 요청에도 빠르고 예측 가능한 응답 성능(반응)을 실현
     2. 리액티브 지원 모듈
        - Spring WebFlux
        - Reactive Spring Data
        - Reactive Spring Security
        - Embedded Netty Server

  4. **Functional APIs**

       - Java 8에 lambda식이 나오면서 함수형 프로그래밍에 대한 니즈를 해소하기 위해 나옴
       - WebFlux.fn
       - WebMvc.fn (Spring Framework 5.2)
       - 기존의 스프링 웹애플리케이션을 함수형 스타일로 작성 가능
       - 스프링 기술과 애노테이션에서 분리된 코드
       - 자바 코드 레벨에서 분석 가능
       - 독립적인 유닛 테스트 가능
       - 스프링 컨테이너에서 독립

  5. **Kotlin 지원**


  6. **Configuration properties**

      1. 프로퍼티를 쓸 때: Relaxed binding 은 여전히 지원
      2. 프로퍼티를 읽을 때: 양식이 통일됨
        - 엘리먼트 구분: "."
        - 영어 소문자 + 숫자
        - 단어 구분자로 "-" 사용 가능
      3. 환경변수(environment variables)에서 컬렉션 데이터의 인덱스 표현 가능
        - MY_VAR_1= a -> my.var[1] = "a"
        - MY_VAR_1_2= b -> my.var[1][2] = "b"
      4. 더 편리한 자료형 인식 (ex: java.time.Duration -> "1s", "2m", "5d")
      5. Origin 지원: 스프링 부트가 읽은 프로퍼티의 위치를 기억하고, 에러가 나면 알려줌
        - ex: "origin": "class path resource [application.properties]:1:27


  1. **Gradle 플러그인**

      - 최소 버전: 4.x
      - bootRepackage -> bootJar & bootWar
      - dependency management 기능을 사용하려면, 플러그인을 명시해야 함


  2. **Actuator 변경점**

        - 보안성 강화: 1.5 에서 기본으로 보여주던 endpoint 를 더이상 보여주지 않음
        - @Endpoints: 커스텀 endpoint 를 환경(MVC, JMX, Jersey..)에 상관 없이 편하게 구현
        - 이름 변화
          - /autoconfig -> /conditions
          - /trace -> /httptrace


  3.  **Spring Security**

      - OAuth 2.0 통합
      - 커스텀 설정이 더 쉬워짐
      - WebSecurityConfigurerAdapter 순서 문제 해결
      - 기본 설정이 하나로 통합됨
      - WebSecurityConfigurerAdapter 를 추가하면 기본 설정이 꺼짐
      - 보안이 중요한 기능들은 명시적으로 작성하게끔 변경 (ex: actuator)