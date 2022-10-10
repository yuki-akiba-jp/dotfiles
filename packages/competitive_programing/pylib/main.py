def billSummation(arr1, arr2):
    re = 0
    for jack, kim in zip(arr1, arr2):
        re += jack*kim

    return re
