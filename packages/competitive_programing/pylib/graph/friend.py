N,A,B = map(int,input().split())
S = []
for i in range(N):
    s = input()
    S.append(s)


if S[A][B] == 'o':
    print('Yes')
else:
    print('No')
