def modpow(root, exponent, mod):
    returnVal = 1
    while exponent:
        if exponent % 2 :
            returnVal = (returnVal * root) % mod
        root = (root * root) % mod
        exponent //= 2

    return returnVal

N, Q = map(int, input().split())
S = input()

char_value = []
for character in S:
    char_value.append(ord(character) - ord('a') + 1)

MOD = 2147483647
BASE = 100


HASH = [ None ] * (N + 1)
HASH[0] = 0
for i in range(N):
	HASH[i + 1] = (HASH[i] * BASE + char_value[i]) % MOD

def hash_value(left, right):
	return (HASH[right] - HASH[left - 1] * modpow(BASE,right-left+1,MOD)) % MOD

for i in range(Q):
    a, b, c, d = map(int, input().split())
    if hash_value(a, b) == hash_value(c, d):
        print("Yes")
    else:
        print("No")

