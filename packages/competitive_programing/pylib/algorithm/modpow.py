def modpow(a, b, mod):
	returnVal = 1
	for i in range(30):
		divider = 2 ** i
		if (b // divider) % 2 == 1:
			returnVal = (returnVal * a) % mod 
		a = (a * a) % mod
	return returnVal

a, b = map(int, input().split())

print(modpow(a, b, 1000000007))
