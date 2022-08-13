N, M, X = map(int, input().split())

G = [[] for _ in range(N)]
for i in range(M):
    A, B = map(int, input().split())

    G[A].append(B)
    G[B].append(A)

# アルルの友達を列挙する
friends = set(G[X])

# アルルの友達の友達を列挙する
result = set()
for v in G[X]:
    for w in G[v]:
        # アルル自身と、アルルの友達は除いておく
        if w != X and not w in friends:
            result.add(w)

# 出力
print(len(result))
