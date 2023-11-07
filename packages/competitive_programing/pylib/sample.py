# n = int(input())
# a = list(map(int, input().split()))
# s = str(input())
# a, n = map(int, input().split())

# n = int(input())
# a = list(map(int, input().split()))
# s = str(input())
# a, n = map(int, input().split())


def is_321_like(n):
    s = str(n)
    
    # Check if each digit is strictly greater than the next digit
    for i in range(len(s) - 1):
        if s[i] <= s[i + 1]:
            return False
    return True

K = int(input())

from itertools import permutations

perm = permutations(range(1, 10))

perms = set(list(perm))

for p in perms:
    print(p)
