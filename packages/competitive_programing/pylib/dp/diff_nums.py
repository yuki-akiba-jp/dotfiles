# 2 つの文字列 S,T が与えられます。
# S に以下の 3 種類の操作のいずれかを順次実施して T に変換します。 そのような一連の操作のうち、最小の操作回数を求めてください。
# 操作
# ＜変更＞ S の中から文字 Si を 1 つ選んで、その文字を好きな文字に変更します
# ＜削除＞ S の中から文字 Si を 1 つ選んで、その文字を削除します
# ＜挿入＞ S の好きな箇所に好きな文字を挿入します
S = str(input())
T = str(input())

INF = 1 << 30
field_len = max(len(S), len(T))+2

dp = [[INF] * field_len for _ in range(field_len)]

dp[0][0] = 0

for i in range(-1, len(S)):
    for j in range(-1, len(T)):
        if i == -1 and j == -1:
            continue
        if i >= 0 and j >= 0:
            if S[i] == T[j]:
                dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j])
            else:
                dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j]+1)
        if i >= 0:
            dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j+1]+1)
        if j >= 0:
            dp[i+1][j+1] = min(dp[i+1][j+1], dp[i+1][j]+1)


print(dp[len(S)][len(T)])
