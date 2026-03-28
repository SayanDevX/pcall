class checker:
    def winType(self, grid, match_len):
        size = len(grid)

        for row in range(size):
            for col in range(size):

                # right
                if col + match_len <= size:
                    cur_player=grid[row][col]

                    if cur_player == 0:
                        continue

                    if all(grid[row][col + i] == cur_player for i in range(match_len)):
                        if grid[row][col]==1:
                            return -10
                        elif grid[row][col]==-1:
                            return 10

                # down
                if row + match_len <= size:
                    cur_player=grid[row][col]
                    if cur_player == 0:
                        continue
                    if all(grid[row + i][col] == cur_player for i in range(match_len)):
                        if grid[row][col]==1:
                            return -10
                        elif grid[row][col]==-1:
                            return 10

                # diagonal right-down
                if row + match_len <= size and col + match_len <= size:
                    cur_player=grid[row][col]
                    if cur_player == 0:
                        continue
                    if all(grid[row + i][col + i] == cur_player for i in range(match_len)):
                        if grid[row][col]==1:
                            return -10
                        elif grid[row][col]==-1:
                            return 10

                # diagonal left-down
                if row + match_len <= size and col - match_len + 1 >= 0:
                    cur_player=grid[row][col]
                    if cur_player == 0:
                        continue
                    if all(grid[row + i][col - i] == cur_player for i in range(match_len)):
                        if grid[row][col]==1:
                            return -10
                        elif grid[row][col]==-1:
                            return 10

        return 0
    

class minimax:
    def __init__(self):
        self.check = checker()
    
    def moveLeft(self, grid, row):
        for i in range(row):
            for j in range(row):
                if(grid[i][j]==0):
                    return True
        return False
    
    def minimax(self, grid, dept, isMax, row, match_len, alpha, beta):
        score=self.check.winType(grid,match_len)

        if score == 10:
            return score

        if score == -10:
            return score
        
        if self.moveLeft(grid, row) == False:
            return 0
        
        if isMax:
            best = -10000

            for i in range(row):
                for j in range(row):
                    if grid[i][j] == 0:
                        grid[i][j] = -1
                        best=max(best, self.minimax(grid,dept+1,not isMax, row, match_len, alpha, beta))
                        grid[i][j] = 0
                        alpha = max(alpha,best)

                        if beta<=alpha:
                            break
                if beta<=alpha:
                    break

            return best
        
        else:
            best = 1000

            for i in range(row):
                for j in range(row):
                    if grid[i][j] == 0:
                        grid[i][j] = 1
                        best=min(best, self.minimax(grid,dept+1,not isMax, row, match_len, alpha, beta))
                        grid[i][j] = 0
                        beta=min(beta,best)
                        if beta<=alpha:
                            break
                if beta<=alpha:
                    break

            return best

    def bestmove(self, grid, row, match_len):
        bestVal = -1000
        bestMove = (-1,-1)

        for i in range(row):
            for j in range(row):
                if grid[i][j] == 0:
                    grid[i][j] = -1
                    moveVal = self.minimax(grid, 0, False, row, match_len, -1000, 1000)
                    grid[i][j] = 0

                    if moveVal > bestVal:
                        bestMove = (i,j)
                        bestVal = moveVal
        return bestMove
    



m= minimax()
c=checker()

row=int(input("enter the no of rows you want in your tic tac toe: "))
match_len=int(input("enter your match length: "))
if match_len>row:
    print("your match length cannot be greater than row")
size=row*row

def printer(grid,row):
    for i in range(row):
        for j in range(row):
            if grid[i][j]==0:
                print(" ",end="|")
            elif grid[i][j]==1:
                print("X",end="|")
            elif grid[i][j]==-1:
                print("O",end="|")

        print()
        for i in range(row):
            print("-",end="-")
        print()

def assigner(grid,row):

    try:
        while True:
            pr1,pc1=map(int,input("player 1 turn ").split())
            if grid[pr1-1][pc1-1] not in [1,-1]:
                if pr1-1<=row and pc1<=row:
                    grid[pr1-1][pc1-1]=1
                    cur_play=1
                else:
                    print("invalid choice")
                    return
                printer(grid,row)
                break
            else:
                print("shit already there")
    except ValueError:
        print("invalid input ")
        return

    a = c.winType(grid,match_len)
    if a == 10 or a == -10:
        print(f"{cur_play} won")
        return 5

    if all(0 not in r for r in grid):
        print("Draw")
        return 5

    t = m.bestmove(grid, row, match_len)
    grid[t[0]][t[1]]=-1
    print("plyaer 2")
    cur_play=-1
    printer(grid, row)

    a = c.winType(grid,match_len)
    if a == 10 or a == -10:
        print(f"{cur_play} won")
        return 5

grid = [[0]*row for i in range(row)]
printer(grid,row)

while True:
    a = assigner(grid,row)
    if a==5:
        break


