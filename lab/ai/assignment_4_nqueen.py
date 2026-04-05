def safe(b, r, c, n):
    for i in range(c):
        if b[r][i]: return False
    for i,j in zip(range(r,-1,-1), range(c,-1,-1)):
        if b[i][j]: return False
    for i,j in zip(range(r,n), range(c,-1,-1)):
        if b[i][j]: return False
    return True

def solve(b, c, n):
    if c == n: return True
    for r in range(n):
        if safe(b, r, c, n):
            b[r][c] = 1
            if solve(b, c+1, n): return True
            b[r][c] = 0
    return False

def nqueens(n):
    b = [[0]*n for _ in range(n)]
    if not solve(b, 0, n):
        print("No solution"); return
    for row in b:
        print(" ".join("Q" if x else "." for x in row))

nqueens(4)