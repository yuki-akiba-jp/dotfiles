
n = int(input())
a = list(map(int, input().split()))
s = str(input())
a, n = map(int, input().split())
a = [input() for _ in range(n)]

with open('./filename', 'r') as f:
    input_lines = [line.strip().split(',') for line in f.readlines()]

    lines = []
    for line in input_lines:
        lines.append(line)
    print(lines)
    # line = list(map(int, line))

    # input_numlines = [line.strip().split(',') for line in f.readlines()]
    # numlines = []
    # for line in input_numlines:
    #     line = list(map(int, line))
    #     numlines.append(line)
    # print(numlines)
