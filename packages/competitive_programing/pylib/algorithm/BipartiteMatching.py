class MaximumFlow_Edge:
	def __init__(self, to, capacity, origin):
		self.to = to
		self.capacity = capacity
		self.origin = origin

def dfs(current_node, goal, flow, Graph, visited):
	if current_node == goal:
		return flow 

	visited[current_node] = True
	for edge in Graph[current_node]:
		if edge.capacity > 0 and not visited[edge.to]:
			dicided_flow = dfs(edge.to, goal, min(flow, edge.capacity), Graph, visited)
			if dicided_flow >= 1:
				edge.capacity -= dicided_flow
				Graph[edge.to][edge.origin].capacity += dicided_flow
				return dicided_flow
	return 0

def maximumflow(N, start, goal, edges):
	Graph = [ list() for _ in range(N + 1) ]
	for a, b, liter in edges:
		Graph[a].append(MaximumFlow_Edge(b, liter, len(Graph[b])))
		Graph[b].append(MaximumFlow_Edge(a, 0, len(Graph[a]) - 1))
	INF = 10 ** 10
	total_flow = 0
	while True:
		visited = [ False ] * (N + 1)
		flow = dfs(start, goal, INF, Graph, visited)
		if flow > 0:
			total_flow += flow
		else:
			break 
	return total_flow

N = int(input())
C = [ input() for _ in range(N) ]

edges = []
for i in range(N):
	for j in range(N):
		if C[i][j] == '#':
			edges.append((i + 1, N + j + 1, 1))
for i in range(N):
	edges.append((2 * N + 1, i + 1,1))
	edges.append((N + i + 1, 2 * N + 2,1))

answer = maximumflow(2 * N + 2, 2 * N + 1, 2 * N + 2, edges)
print(answer)

