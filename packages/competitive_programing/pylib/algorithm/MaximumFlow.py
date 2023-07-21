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

N, M = map(int, input().split())
edges = [ list(map(int, input().split())) for _ in range(M) ]
answer = maximumflow(N, 1, N, edges)
print(answer)
