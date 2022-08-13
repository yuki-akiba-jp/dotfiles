# すべての要素を次のルールに従い 1 つ以上の要素とマッチさせます。
# 各要素は 1 つ以上の異なる系列の要素とマッチングさせる必要がある
# マッチ同士は交差させることができない。 各ペアをマッチさせたときのコストはCi,j です。
# このとき、コストの最小値を求めてください。

INF = 1 << 29
N, M = map(int, input().split())
C = []
for i in range(N):
    c = list(map(int, input().split()))
    C.append(c)

field_size = max(N, M)+10
dp = [[INF]*field_size for _ in range(field_size)]
dp[0][0] = 0
for i in range(N):
    for j in range(M):
        if i-1 <= N:
            dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j+1] + C[i][j])
        if j+1 <= M:
            dp[i+1][j+1] = min(dp[i+1][j+1], dp[i+1][j] + C[i][j])
        if i+1 <= N and j+1 <= M:
            dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j] + C[i][j])


print(dp[N][M])
