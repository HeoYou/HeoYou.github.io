---
layout: post
title: "[Algorithm] dijkstra"
tags: 
  - dijkstra
  - BFS
  - heap
  - graph
  - python
category:
  - Algorithm
---

## Intro

알고리즘 푸는데 항상 막히던 부분이 있었다. 그게 다익스트라를 써야 하는 건지 오늘 알아서 다익스트라를 정리해 보겠다.


## Dijkstra

여러 개의 노드가 존재할 때, 특정한 노드에서 출발하여 다른 노드로 가는 각각의 최단 경로를 구해주는 알고리즘이다.

간선(edge)의 값이 0 이상의 양수일 때 정상적으로 동작

### 1. 다익스트라 알고리즘 아이디어

매번 가장 거리가 짧은 노드를 선택해서 최단거리를 찾는다.

#### 알고리즘 동작 원리

1. 출발 노드 선택
2. 최단 거리 테이블 초기화(최단 거리를 기록할 테이블 정의)
3. 방문하지 않는 노드 중 최단거리 노드를 선택해 방문
4. 다른 노드로 가는 간선 비용을 계산헤 최단 거리 테이블 업데이트
5. 3, 4 과정 반복

먼저 2개의 1차원 리스트를 정의해야한다. 

첫 번째는 최단거리를 기록할 테이블
두 번째는 방문한 노드가 무엇인지 체크하기 위한리스트

### 2. 구현 방법

#### 순차 탐색

방문하지 않은 노드 중에서 최단 거리가 가장 짧은 노드를 선택하기 위해 순차탐색을 이용한다.

이때 시간 복잡도는 O(N^2)이다. 따라서 노드의 수가 많아지면 비효율적이다.

#### 최소 힙

**이번해 구현홰볼 방법이다.**

방문하지 않은 노드 중 최단거리가 가장 짧은 노드를 선택하기 위해 최소 힙을 사용한다.

힙에서 노드를 꺼냇는데 해당 노드를 이미 처리한적이 있다면 무시하고 아직 처리하지 않은 노드에 대해서만 처리한다.

아래 소스는 백준 1916번 문제를 풀이한 내역이다.

```python
import heapq
import sys

input = sys.stdin.readline

n = int(input())
m = int(input())


graph = [[] for i in range(n + 1)]
heap = [] #거리가 작은 것부터 연산하는것이 다익스트라에서 좋다고 들었다 그러므로 힙을 사용할것이다.
answer = [sys.maxsize] * (n + 1)

def dijkstra(node):
    answer[node] = 0
    heapq.heappush(heap, (0, node))

    while heap:
        val, now = heapq.heappop(heap)

        if answer[now] < val:
            continue

        for w, next_node in graph[now]:

            next_wei = w + val

            if next_wei < answer[next_node]:
                answer[next_node] = next_wei
                heapq.heappush(heap, (next_wei, next_node))



for i in range(m):
    start, end, value = map(int, input().split())
    graph[start].append((value, end))
s, e = map(int, input().split())

dijkstra(s)
print(answer[e])
```