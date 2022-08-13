# 総和が M となるようにいくつかの整数を選ぶ方法を考えます。 選ぶ必要のある整数の個数の最小値を求めてください。
N, M = map(int, input().split())
A = list(map(int, input().split()))

INF = 1 << 20

dp = [[INF]*(M+1) for _ in range(N+1)]

dp[0][0] = 0
for i in range(N):
    for j in range(M+1):
        dp[i+1][j] = min(dp[i+1][j], dp[i][j])
        if j >= A[i]:
            dp[i+1][j] = min(dp[i+1][j], dp[i][j-A[i]] + 1)

if dp[N][M] < INF:
    print(dp[N][M])
else:
    print(-1)
