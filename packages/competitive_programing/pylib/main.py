
def integer_to_bit_string(num):
    bit_string = ''
    while num:
        to_append_int = num % 2
        bit_string += str(to_append_int)
        num //= 2
    return bit_string[::-1]


def bit_string_to_integer(bit_string):
    bit_string = bit_string[::-1]

    re = 0
    powpow = 1
    for i in range(len(bit_string)):
        if bit_string[i] == '1':
            re += powpow
        powpow *= 2
    return re


def func(n_bit_string):
    cnt = 0
    for index in range(len(n_bit_string)):
        if n_bit_string[index] == '1':
            cnt += 1
            if cnt == 2:
                string = n_bit_string[cnt:]

                break


N = int(input())
n_bit_string = integer_to_bit_string(N)

# N, W = map(int, input().split())

# w = [0]*N
# v = [0]*N
# for i in range(N):
#     w_in, v_in = map(int, input().split())
#     w[i] = w_in
#     v[i] = v_in


# dp = [[0]*(W+1) for i in range(N+1)]

# for i in range(N):
#     for j in range(W+1):
#         if j < w[i]:
#             dp[i+1][j] = dp[i][j]
#         else:
#             dp[i+1][j] = max(dp[i][j], dp[i][j-w[i]]+v[i])

# print(dp[N][W])
