---
layout: post
title: "[Spring] Circular dependencies(순환참조)"
tags: 
  - Tip
  - Circular dependencies
category:
  - Spring boot
  - Spring Framework
---

## Intro

친구가 스프링 시큐리티를 적용하면서 "The dependencies of some of the beans in the application context form a cycle" 오류가 발생했다고 나에게 물어봤다. 
![image](https://user-images.githubusercontent.com/51642448/168603912-d1ea45ce-05ad-44cb-9c0b-f8c253b5c45e.png)

그래서 검색을 해보았다.

## 순환참조??

순환참조란 A클래스가 B클래스의 Bean을 주입받고, B클래스가 A클래스의 Bean을 주입받는 상황이다. 
서로 참조를 하면서 순환참조가 발생한다.

## 왜?? 

IoC컨테이너에 있는 Bean을 주입받기 위해서 세 가지 방법을 사용할 수 있다.

1. 필드 주입방식
2. Setter 주입방식
3. 생성자 주입방식


### 필드, Setter 주입방식 

필드 주입방식과 Setter주입방식에서는 애플리케이션 실행과정에서 예외가 발생하지 않는다. 그리고 실제 두개의 클래스가 순환참조하고 있다고 하더라도 당장에 문제가 발생하지 않는다. 문제점은 해당 메소드가 호출되었을 때이다.

```java
@Service
public class ServiceA {
    @Autowired
    private ServiceB serviceB;
    
    public void run() {
    	serviceB.run();
    }
}

@Service
public class ServiceB {
    @Autowired
    private ServiceA serviceA;
    
    public void run() {
    	serviceA.run();
    }
}
```
#### 필드, Setter 주입방식 정리
1. 스프링 애플리케이션 로딩 시 예외가 발생하지 않는다.
2. 단순 클래스가 순호나참조하는 것이 아니라 메소드가 순환호출 되어야하고, 해당 메소드가 호출되는 시점에 예외가 발생한다. 

### 생성자 주입방식

스프링 애플리케이션은 로딩되는 시점에서 A클래스가 B클래스를 의존하고 B클래스가 C클래스를 의존한다면,
A클래스를 만들 때 B클래스가 필요하니 B부터 생성하고 B를 생성하려면 C가 있어야 하니 C를 가장먼저 생성한다.

한마디로 C -> B -> A 순서대로 Bean을 생성한다.

**여기서 만약 A클래스와 B클래스가 서로 의존한 상태라면??**

A클래스, B클래스가 Bean을 생성할 때 서로 필요하게 되니까 무한 반복에 빠지게된다.

예를 들어 A클래스의 Bean을 만드는 과정에서 B클래스의 Bean을 주입하고, B클래스가 없으니까 Bean을 생성하면서 A클래스를 주입하려고 하는데 없어서 A클래스의 Bean을 생성하게 된다. 이렇게 무한 반복에 빠지게 되는 현상이다.

#### 생성자 주입 방식 정리
1. 클래스가 서로 의존성 주입을 통해 순환참조하고 있을 때 발생하는 문제
2. 스프링 애플리케이션 로딩시점에서 예외가 발생


## 해결방법

순환참조문제가 발생할 수 있는 구조자체를 만들지 않는 것이 가장 좋다.!!

처음부터 순환의 고리를 끊어내야한다. 하지만 당장 순환을 끊을 수 없는 경우에는 @Lazy 어노테이션을 통해 임의로 해결할 수 있다.