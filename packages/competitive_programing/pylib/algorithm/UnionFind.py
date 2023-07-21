class UnionFind:
    def __init__(self, N):
        self.parent = [None] * (N + 1)
        self.rank = [ 1 ] * (N + 1)

    def find(self, value):
        if  not self.parent[value] :
            return value
        self.parent[value] = self.find(self.parent[value])
        return self.parent[value]


    def unite(self, u, v):
        rootu = self.find(u)
        rootv = self.find(v)
        if rootu != rootv:
            if self.rank[rootu] < self.rank[rootv]:
                self.parent[rootu] = rootv
                self.rank[rootv] += self.rank[rootu]
            else:
                self.parent[rootv] = rootu
                self.rank[rootu] += self.rank[rootv]

    def is_same(self, u, v):
        return self.find(u) == self.find(v)

N, Q = map(int, input().split())
queries = [ list(map(int, input().split())) for _ in range(Q) ]

UFtree = UnionFind(N)
for query_Num, u, v in queries:
	if query_Num == 1:
		UFtree.unite(u, v)
	if query_Num == 2:
		if UFtree.is_same(u, v):
			print("Yes")
		else:
			print("No")
