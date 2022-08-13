# 頂点 v を始点とした深さ優先探索
def rec(v, G, seen):
    # 頂点 v を黒く塗る (= seen[v] を true に変える)
    seen[v] = True
    # v を出力する (改行を防ぐため、end 引数を使って命令している)
    print(v, end = " ")
    # G[v] に含まれる頂点 v2 について、
    for v2 in G[v]:
        # v2 がすでに黒く塗られているならば、スキップする
        if seen[v2]: continue
        # v2 始点で深さ優先探索を行う (関数を再帰させる)
        rec(v2, G, seen)
    return

# main
# 入力を受け取る
N, M = map(int, input().split())
G = [[] for _ in range(N)]  # グラフを表現する隣接リスト
for i in range(M):
    a, b = map(int, input().split())
    # 頂点 a から頂点 b への辺を隣接リストに入れる
    G[a].append(b)

# 問題文より、各 G[v] は小さい順に並べる
for v in range(N):
   G[v].sort()

seen = [False for _ in range(N)]    # seen[v]：頂点 v が黒く塗られいているなら true, そうでないなら false
# 頂点 0 を始点として深さ優先探索を開始する
rec(0, G, seen)
