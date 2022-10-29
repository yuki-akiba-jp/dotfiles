def joinWords(stringArr, delimiter):
    re = ''
    for word in stringArr:
        re += word+delimiter
    delimiterLen = len(delimiter)
    return re[:-delimiterLen]
