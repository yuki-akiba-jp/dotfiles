def isOK(array, index,  key): 
    if array[index] >= key :
        return True
    else:
        return False


def binary_search(array, key) :
    left = -1 
    right = len(array)

    while (abs(right - left )> 1) :
        mid = left + (right - left) // 2

        if isOK(array,mid, key):
            right = mid
        else:
            left = mid

    return right

a = [1, 14, 32, 51, 51, 51, 243, 419, 750, 910]
print(binary_search(a,51))
print(binary_search(a,1))
print(binary_search(a,910))
print(binary_search(a,52))
print(binary_search(a,0))
print(binary_search(a,911))
