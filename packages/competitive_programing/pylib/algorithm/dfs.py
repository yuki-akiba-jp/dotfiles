import sys

sys.setrecursionlimit(10**5)

def dfs(current_node, Graph, visited):
    visited[current_node] = True
    for adjacent_node in Graph[current_node]:
        if not visited[adjacent_node]:
            dfs(adjacent_node, Graph, visited)

N, M = map(int, input().split())
edges = [ list(map(int, input().split())) for _ in range(M) ]

Graph = [ [] for _ in range(N + 1) ]
for a, b in edges:
	Graph[a].append(b)
	Graph[b].append(a)

visited = [ False ] * (N + 1)
dfs(1, Graph, visited)

answer = True
for node in range(1, N + 1):
	if not visited[node]:
		answer = False

if answer:
	print("The graph is connected.")
else:
	print("The graph is not connected.")
