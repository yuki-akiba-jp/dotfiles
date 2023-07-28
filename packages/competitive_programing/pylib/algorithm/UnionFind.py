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
        parentOfU = self.find(u)
        parentOfV = self.find(v)
        if parentOfU != parentOfV:
            if self.rank[parentOfU] < self.rank[parentOfV]:
                self.parent[parentOfU] = parentOfV
                self.rank[parentOfV] += self.rank[parentOfU]
            else:
                self.parent[parentOfV] = parentOfU
                self.rank[parentOfU] += self.rank[parentOfV]

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
