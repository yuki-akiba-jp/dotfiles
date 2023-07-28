# n = int(input())
# a = list(map(int, input().split()))
# s = str(input())
# a, n = map(int, input().split())
# a = [input() for _ in range(n)]

N,M = map(int, input().split())
P = [None] * N
C = [None] * N
F = [[] for _ in range(N)]
for i in range(N):
    P[i],C[i], *F[i] = map(int, input().split())


