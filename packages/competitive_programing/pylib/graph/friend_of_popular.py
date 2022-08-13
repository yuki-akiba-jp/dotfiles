N, M = map(int, input().split())
G = [[] for i in range(N)]
for i in range(M):
    A, B = map(int, input().split())
    G[A].append(B)
    G[B].append(A)

max_index = -1
max_len = -1
# 頂点 v ごとに、終点頂点を番号順にして出力
for i in range(N):
    if len(G[i]) > max_len:
        max_index = i
        max_len = len(G[i])

G[max_index].sort()
print(*G[max_index])
