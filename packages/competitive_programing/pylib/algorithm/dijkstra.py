import heapq


class Edge:
    def __init__(self, to, cost):
        self.to = to
        self.cost = cost

    def __lt__(self, other):
        return self.cost < other.cost

class Node:
    def __init__(self):
        self.edges = []

    def add_edge(self, to, cost):
        self.edges.append(Edge(to, cost))


def run_dijkstra():
    N, M = map(int, input().split())
    nodes = [Node() for _ in range(N + 1)]
    for _ in range(M):
        a, b, cost = map(int, input().split())
        nodes[a].add_edge(b, cost)
        nodes[b].add_edge(a, cost)  # Assuming undirected graph

    INF = 10 ** 9
    is_confirmed = [False] * (N + 1)
    distance = [INF] * (N + 1)
    distance[1] = 0

    priority_queue = []
    heapq.heappush(priority_queue, Edge(1, distance[1]))

    while priority_queue:
        current_node_idx = heapq.heappop(priority_queue).to
        if is_confirmed[current_node_idx]:
            continue
        
        is_confirmed[current_node_idx] = True

        for edge in nodes[current_node_idx].edges:
            if distance[edge.to] > distance[current_node_idx] + edge.cost:
                distance[edge.to] = distance[current_node_idx] + edge.cost
                heapq.heappush(priority_queue, Edge(edge.to, distance[edge.to]))

    for dist in distance[1:]:
        print(dist if dist != INF else "-1")

if __name__ == "__main__":
    run_dijkstra()
