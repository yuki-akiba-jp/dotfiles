n, m = map(int, input().split())
graph = [[] for _ in range(n)]  # グラフを表現する隣接リスト

for i in range(m):
    a, b = map(int, input().split())
    a -= 1
    b -= 1
    graph[a].append(b)
    graph[b].append(a)


print(graph)
visited = [False for _ in range(n)]


def dfs(currentIndex):
    visited[currentIndex] = True
    for val in graph[currentIndex]:
        if val:
            continue
        dfs(val)


cnt = 0

for i in range(n):
    if not visited[i]:
        cnt += 1
        dfs(i)

print(cnt)
