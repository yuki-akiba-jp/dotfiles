# いくつかを選んで総和が M となるようにできるか判定してください。 ただし、整数AiはBi個まで選ぶことができます。
N, M = map(int, input().split())
A = [0]*N
B = [0]*N
for i in range(N):
    a, b = map(int, input().split())
    A[i] = a
    B[i] = b


INF = 1 << 20

dp = [[INF]*(M+1) for _ in range(N+1)]

dp[0][0] = 0
for i in range(N):
    for j in range(M+1):

        if dp[i][j] < INF:
            dp[i+1][j] = 0

        if j >= A[i]:
            if dp[i][j-A[i]] < INF:
                dp[i+1][j] = min(dp[i+1][j], 1)
            if dp[i+1][j-A[i]] < B[i]:
                dp[i+1][j] = min(dp[i+1][j], dp[i+1][j-A[i]]+1)
if dp[N][M] < INF:
    print('Yes')
else:
    print('No')
