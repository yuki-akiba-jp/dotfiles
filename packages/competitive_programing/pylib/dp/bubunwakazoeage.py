# 総和が M となるようにいくつかの整数を選ぶ方法は何通りありますか。 ただし、答えを 1000 で割った余りを出力してください
N, M = map(int, input().split())

A = list(map(int, input().split()))

dp = [[0]*(M+1) for _ in range(N+1)]

dp[0][0] = 1
for i in range(N):
    for j in range(M+1):
        dp[i+1][j] += dp[i][j]
        if j >= A[i]:
            dp[i+1][j] += dp[i][j-A[i]]

print(dp[N][M] % 1000)
