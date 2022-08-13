n = int(input())
a = list(map(int, input().split()))
re = 0
for num in a:
    if num >= 0:
        re += num

print(re)
