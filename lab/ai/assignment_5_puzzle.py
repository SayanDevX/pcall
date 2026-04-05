import copy

GOAL = [[1,2,3],[4,5,6],[7,8,0]]

def h(s): return sum(s[i][j] and s[i][j] != GOAL[i][j] for i in range(3) for j in range(3))

def neighbors(s):
    x,y = next((i,j) for i in range(3) for j in range(3) if s[i][j]==0)
    res = []
    for dx,dy in [(-1,0),(1,0),(0,-1),(0,1)]:
        nx,ny = x+dx, y+dy
        if 0<=nx<3 and 0<=ny<3:
            t = copy.deepcopy(s)
            t[x][y], t[nx][ny] = t[nx][ny], t[x][y]
            res.append(t)
    return res

def hill_climbing(s):
    while True:
        nxt = min(neighbors(s), key=h)
        if h(nxt) >= h(s): return s
        s = nxt

start = [[1,2,3],[4,0,6],[7,5,8]]
for row in hill_climbing(start): print(row)