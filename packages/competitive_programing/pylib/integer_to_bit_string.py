def integer_to_bit_string(num):
    bit_string = ''
    while num:
        to_append_int = num % 2
        bit_string += str(to_append_int)
        num //= 2
    return bit_string[::-1]
