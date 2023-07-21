import heapq


class Edge:
    def __init__(self, to, cost):
        self.cost = cost
        self.to = to

# less than  method is required for heapq to compare the cost of edges
    def __lt__(self, other):
        return self.cost < other.cost

N, M = map(int, input().split())

Graph = [ list() for _ in range(N + 1) ]
for i in range(M):
    a,b,cost = map(int, input().split())
    Graph[a].append(Edge(b, cost))
    Graph[b].append(Edge(a, cost))

INF = 10 ** 10
is_confirmed = [ False ] * (N + 1)
distance = [ INF ] * (N + 1)
distance[1] = 0
Q = []

heapq.heappush(Q, Edge(1,distance[1]))

while len(Q) >= 1:
	node = heapq.heappop(Q).to
	if is_confirmed[node]:
		continue
	
	is_confirmed[node] = True

	for edge in Graph[node]:
		if distance[edge.to] > distance[node] + edge.cost:
			distance[edge.to] = distance[node] + edge.cost
			heapq.heappush(Q, Edge(edge.to,distance[edge.to]) )

for i in range(1, N + 1):
	if distance[i] != INF:
		print(distance[i])
	else:
		print("-1")
