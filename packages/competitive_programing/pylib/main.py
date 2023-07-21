

# n = int(input())
# s = list(map(int, input().split()))
# s = str(input())
# a, n = map(int, input().split())
# a = [input() for _ in range(n)]

n = int(input())
# s = list(map(int, input().split()))
a = [input() for _ in range(n)]
new_a = []
for st in a:
    li = []
    for ch in st:
        li.append(ch)
    new_a.append(li)

