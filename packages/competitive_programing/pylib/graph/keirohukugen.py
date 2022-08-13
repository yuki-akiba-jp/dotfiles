# 辺情報を表す構造体
class edge:
    def __init__(self, start, end, leng):
        self.start = start  # 辺の始点
        self.end = end      # 辺の終点
        self.leng = leng    # 辺の重み

INF = 10**9 # 初期化で使う十分大きな数

# main
# 入力を受け取る
N, M = map(int, input().split())
graph_edges = [[] for _ in range(M)]    # graph_edges[i]：i 番目の辺情報
for i in range(M):
    u, v, w = map(int, input().split())
    graph_edges[i] = [u, v, w]

dist = [INF for _ in range(N)]  # dist[i]：現在の d_i の値 (0 以外は 10^9 で初期化する)
# d_0 を 0 で初期化する
dist[0] = 0
prev = [-1 for _ in range(N)]   # prev[i]：頂点 0 から i への最短経路において、頂点 i の前にどこにいたか

# k = 1, 2, …, N-1 回目のステップについて、
for k in range(1, N):
    flg = False  # k 回目のステップで dist の変更があるかを表すフラグ

    # i = 0, 1, …, M-1 の順に、辺 i への操作を行う
    for i in range(M):
        # i 番目の辺の始点、終点、重みをそれぞれ u, v, w とおく
        u, v, w = graph_edges[i]

        # dist[v] を更新するときに限り、prev[v] も更新する
        if dist[u] + w < dist[v] and dist[u] != INF:
            dist[v] = dist[u] + w
            prev[v] = u

order = []  # 頂点 0 から N-1 へ向かう最短経路を保存する配列
# 頂点 N-1 を開始点として prev をさかのぼることで、経路を求める
now = N-1
while now != -1:
    order.append(now)
    now = prev[now]
# 配列 order を反転させる
order.reverse()

# 答えをフォーマット通りに出力する
print(len(order))
print(*order)
