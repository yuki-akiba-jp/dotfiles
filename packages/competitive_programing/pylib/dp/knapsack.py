N, W = map(int, input().split())

w = [0]*N
v = [0]*N
for i in range(N):
    w_in, v_in = map(int, input().split())
    w[i] = w_in
    v[i] = v_in


dp = [[0]*(W+1) for i in range(N+1)]

for i in range(N):
    for j in range(W+1):
        if j < w[i]:
            dp[i+1][j] = dp[i][j]
        else:
            dp[i+1][j] = max(dp[i][j], dp[i][j-w[i]]+v[i])

print(dp[N][W])
