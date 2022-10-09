N = int(input())
a = list(map(int, input().split()))
a.sort()
seta = set(a)
seta = list(seta)
bucket_len = 3*10**5+10
bucket = [0]*bucket_len
maxCnt = bucket_len
if not 1 in a:
    print(0)
    exit()

for num in a:
    bucket[num] += 1

pool = len(a)-len(set(a))
ans = 0
for index in range(1, bucket_len):
    if bucket[index] >= 1:
        ans += 1
    elif pool-2 >= 0:
        pool -= 2
        ans += 1
    elif len(seta) >= 2:
        for _ in range(2):
            if seta[-1] > index:
                delnum = seta[-1]
                seta.pop(-1)
                bucket[delnum] -= 1
            else:
                print(ans)
                exit()

        ans += 1

    else:
        break


print(ans)
