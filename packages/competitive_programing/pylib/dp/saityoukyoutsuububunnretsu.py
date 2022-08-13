# 2 つの文字列 S,T が与えられます。
# S と T の共通の部分文字列となる文字列の長さの最大値を求めてください。
# ただし、 部分文字列は「文字列から文字を幾つか抜き出して順に繋げてできる文字列」を指します。 (たとえば、a, ad, abe は abcde の部分文字列です。)
S = str(input())
T = str(input())
field_size = max(len(S), len(T))+10

dp = [[0]*field_size for _ in range(field_size)]

for i in range(len(S)):
    for j in range(len(T)):
        if S[i] == T[j]:
            dp[i+1][j+1] = max(dp[i+1][j+1], dp[i][j]+1)
        dp[i+1][j+1] = max(dp[i+1][j+1], dp[i+1][j])
        dp[i+1][j+1] = max(dp[i+1][j+1], dp[i][j+1])

print(dp[len(S)][len(T)])
