from collections import deque


def bfs(current_node, Graph, visited):
    Q = deque()
    Q.append(current_node)

    while len(Q) >= 1:
        current_node = Q.popleft()
        for adjacent_node in Graph[current_node]:
            if not visited[adjacent_node]:
                visited[adjacent_node] = True
                Q.append(adjacent_node)

N, M = map(int, input().split())
edges = [ list(map(int, input().split())) for _ in range(M) ]

Graph = [ [] for _ in range(N + 1) ]
for a, b in edges:
	Graph[a].append(b)
	Graph[b].append(a)

visited = [ False ] * (N + 1)
bfs(1, Graph, visited)

answer = True
for node in range(1, N + 1):
	if not visited[node]:
		answer = False

if answer:
	print("The graph is connected.")
else:
	print("The graph is not connected.")
