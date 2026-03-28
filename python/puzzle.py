import heapq

# Manhattan Distance
def manhattan_distance(state, goal_state):
    distance = 0
    for i in range(3):
        for j in range(3):
            value = state[i][j]
            if value != 0:
                for x in range(3):
                    for y in range(3):
                        if goal_state[x][y] == value:
                            distance += abs(i - x) + abs(j - y)
    return distance

# Find zero position
def find_zero(state):
    for i in range(3):
        for j in range(3):
            if state[i][j] == 0:
                return i, j

# Generate neighbors with move direction
def get_neighbors(state):
    neighbors = []
    x, y = find_zero(state)

    moves = {
        "UP": (-1, 0),
        "DOWN": (1, 0),
        "LEFT": (0, -1),
        "RIGHT": (0, 1)
    }

    for move, (dx, dy) in moves.items():
        nx, ny = x + dx, y + dy
        if 0 <= nx < 3 and 0 <= ny < 3:
            new_state = [row[:] for row in state]
            new_state[x][y], new_state[nx][ny] = new_state[nx][ny], new_state[x][y]
            neighbors.append((new_state, move))

    return neighbors

# Convert state to tuple
def state_to_tuple(state):
    return tuple(tuple(row) for row in state)

# A* Algorithm
def a_star(start_state, goal_state):

    open_list = []
    heapq.heappush(open_list, (0, start_state))

    g_cost = {state_to_tuple(start_state): 0}
    parent = {state_to_tuple(start_state): None}
    move_taken = {state_to_tuple(start_state): None}

    visited = set()

    while open_list:
        _, current = heapq.heappop(open_list)

        if current == goal_state:
            path = []
            moves = []

            while current:
                path.append(current)
                moves.append(move_taken[state_to_tuple(current)])
                current = parent[state_to_tuple(current)]

            path.reverse()
            moves.reverse()

            print("\n✅ Solution Found!\n")
            step = 1
            for i in range(len(path)):
                if moves[i]:
                    print("Step:", step)
                    step += 1
                    print(f"Move: {moves[i]}")
                else:
                    print("Initial State")
                for row in path[i]:
                    print(row)
                print()

            return

        visited.add(state_to_tuple(current))

        for neighbor, move in get_neighbors(current):
            neighbor_tuple = state_to_tuple(neighbor)

            if neighbor_tuple in visited:
                continue

            tentative_g = g_cost[state_to_tuple(current)] + 1

            if neighbor_tuple not in g_cost or tentative_g < g_cost[neighbor_tuple]:
                g_cost[neighbor_tuple] = tentative_g
                f_cost = tentative_g + manhattan_distance(neighbor, goal_state)

                heapq.heappush(open_list, (f_cost, neighbor))
                parent[neighbor_tuple] = current
                move_taken[neighbor_tuple] = move

    print("❌ No Solution Found")

# -------- USER INPUT --------

def get_state(name):
    print(f"\nEnter {name} State (use 0 for blank)")
    nums = []

    for i in range(3):
        row = list(map(int, input(f"Row {i+1}: ").split()))
        if len(row) != 3:
            raise ValueError("Each row must contain exactly 3 numbers.")
        nums.extend(row)

    if sorted(nums) != list(range(9)):
        raise ValueError("Numbers must be from 0 to 8 without repetition.")

    return [nums[i*3:(i+1)*3] for i in range(3)]

# Main
try:
    start_state = get_state("Initial")
    goal_state = get_state("Goal")
    a_star(start_state, goal_state)
except ValueError as e:
    print("Input Error:", e)
