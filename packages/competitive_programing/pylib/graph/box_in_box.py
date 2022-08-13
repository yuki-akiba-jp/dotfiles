N, X = map(int, input().split())
A = list(map(int, input().split()))
A.insert(0, -1)  # A は 1 始まりなので先頭にダミーを入れる

# 頂点 X から遡っていく
res = 0
while X != 0:
    res += 1
    X = A[X]

print(res)
