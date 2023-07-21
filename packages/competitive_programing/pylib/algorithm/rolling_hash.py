def modpow(a, b, mod):
	returnVal = 1
	for i in range(30):
		divider = 2 ** i
		if (b // divider) % 2 == 1:
			returnVal = (returnVal * a) % mod 
		a = (a * a) % mod
	return returnVal



N, Q = map(int, input().split())
S = input()
queries = [ list(map(int, input().split())) for _ in range(Q) ]

char_value = list(map(lambda character: ord(character) - ord('a') + 1, S))

MOD = 2147483647
BASE = 100


HASH = [ None ] * (N + 1)
HASH[0] = 0
for i in range(N):
	HASH[i + 1] = (HASH[i] * BASE + char_value[i]) % MOD

def hash_value(left, right):
	return (HASH[right] - HASH[left - 1] * modpow(BASE,right-left+1,MOD)) % MOD

for a, b, c, d in queries:
	hash1 = hash_value(a, b)
	hash2 = hash_value(c, d)
	if hash1 == hash2:
		print("Yes")
	else:
		print("No")

