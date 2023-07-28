def modpow(root, exponent, mod):
    returnVal = 1
    while exponent:
        if exponent % 2 :
            returnVal = (returnVal * root) % mod
        root = (root * root) % mod
        exponent //= 2

    return returnVal

a, b = map(int, input().split())

print(modpow(a, b, 1000000007))
