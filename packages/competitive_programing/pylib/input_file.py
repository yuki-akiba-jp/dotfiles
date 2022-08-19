with open('./filename', 'r') as f:
    lines = [line.strip() for line in f.readlines()]
    print(lines)
