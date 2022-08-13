import heapq

# 辺情報を表す構造体
class edge:
    def __init__(self, end, leng):
        self.end = end      # 辺の終点
        self.leng = leng    # 辺の重み

INF = 10**9 # 初期化で使う十分大きな数

# main
# 入力を受け取る
N, M = map(int, input().split())
G = [[] for _ in range(N)]
for i in range(M):
    u, v, w = map(int, input().split())
    G[u].append(edge(v, w))

dist = [INF for _ in range(N)]  # dist[i]：頂点 0 から頂点 i への暫定的な経路長
dist[0] = 0
done = [False for _ in range(N)]    # done[i]：頂点 i の最短距離が確定しているか

while True:
    v, d = -1, 2*INF    # v：次に見るべき頂点、d：仮の最小値
    # 操作 1. を実行する (done[v] が false、かつ dist[v] が最小の v を探す)
    for i in range(N):
        if done[i] == False and dist[i] < d:
            v = i
            d = dist[i]
    
    # もしそのような v が見つからないなら、すべての done[v] が true になっているので終了する
    if v == -1: break

    # 操作 2. を実行する (頂点 v を始点とする辺に対し、dist の更新をする)
    for e in G[v]:
        dist[e.end] = min(dist[e.end], dist[v] + e.leng)
    
    # 操作 3. を実行する (頂点 v への最短距離が確定したことを表す)
    done[v] = True

# 答えを出力する
for i in range(N):
    print(dist[i])
