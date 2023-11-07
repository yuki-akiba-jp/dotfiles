# n = int(input())
# a = list(map(int, input().split()))
# s = str(input())
# a, n = map(int, input().split())
rows  = []

for i in range(18):
    lis = list(map(int, input().split()))
    rows.append(lis)

for i in range(18):
    cnt = 0
    for row in rows:
        cnt+=row[i]

    print(i+1,cnt)


