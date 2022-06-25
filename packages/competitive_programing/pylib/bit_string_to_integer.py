def bit_string_to_integer(bit_string):
    bit_string = bit_string[::-1]

    re = 0
    powpow = 1
    for i in range(len(bit_string)):
        if bit_string[i] == '1':
            re += powpow
        powpow *= 2
    return re
