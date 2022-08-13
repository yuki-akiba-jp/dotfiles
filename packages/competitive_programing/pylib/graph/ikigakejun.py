# スタックオーバーフローを防ぐ
import sys
sys.setrecursionlimit(10 ** 6)

# 頂点 v を根とする部分木を探索
def rec(v, chs):
    # 頂点 v を出力
    print(v, end=' ')

    # 頂点 v の各子頂点を探索
    for ch in chs[v]:
        # 子頂点 ch を根とした部分木を再帰的に探索
        rec(ch, chs)

# 頂点数の入力
N = int(input())

# 親頂点リスト
P = list(map(int, input().split()))

# 各頂点の子頂点リストを作る
chs = [[] for v in range(N)]
for v in range(1, N):
    # 頂点 v の親
    p = P[v - 1]

    # 親 p の子頂点リストに頂点 v を挿入
    chs[p].append(v)

# 根頂点 (0) から再帰的に探索
rec(0, chs)
