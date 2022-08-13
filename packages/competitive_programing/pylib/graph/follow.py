N,M = map(int,input().split())
A = []
B = []
for i in range(N):
    a,b = map(int,input().split())
    A.append(a)
    B.append(b)


re = [[]*N]
for i in A:
    for b in B:
        re[i].append(b)
re.sort()

for ary in re:
    for num in ary:
        print(num,end=' ')
    print('\n')

