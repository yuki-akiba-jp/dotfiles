# N 個の正の整数 Aと正の整数 M が与えられます。 いくつかの整数を選んで総和が M となるようにできますか。

N, M = map(int, input().split())


A = list(map(int, input().split()))

dp = [[False]*(M+1) for _ in range(N+1)]

dp[0][0] = True
for i in range(N):
    for j in range(M+1):
        dp[i+1][j] |= dp[i][j]
        if j >= A[i]:
            dp[i+1][j] |= dp[i][j-A[i]]

if dp[N][M]:
    ans = 'Yes'
else:
    ans = 'No'

print(ans)
