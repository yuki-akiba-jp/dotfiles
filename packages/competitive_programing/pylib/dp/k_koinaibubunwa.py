# K 個以内の整数を選んで総和が M となるようにできるか判定してください。
N, M, k = map(int, input().split())
A = list(map(int, input().split()))

INF = 1 << 20

dp = [[INF]*(M+1) for _ in range(N+1)]

dp[0][0] = 0
for i in range(N):
    for j in range(M+1):
        dp[i+1][j] = min(dp[i+1][j], dp[i][j])
        if j >= A[i]:
            dp[i+1][j] = min(dp[i+1][j], dp[i][j-A[i]] + 1)

if dp[N][M] <= k:
    print('Yes')
else:
    print('No')
