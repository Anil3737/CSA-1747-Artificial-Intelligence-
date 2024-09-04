import heapq

class PuzzleState:
    def __init__(self, board, moves=0, previous=None):
        self.board = board
        self.moves = moves
        self.previous = previous
        self.zero_position = self.find_zero_position()
        self.manhattan_distance = self.calculate_manhattan_distance()

    def find_zero_position(self):
        for i in range(3):
            for j in range(3):
                if self.board[i][j] == 0:
                    return i, j

    def calculate_manhattan_distance(self):
        distance = 0
        for i in range(3):
            for j in range(3):
                value = self.board[i][j]
                if value != 0:
                    target_x = (value - 1) // 3
                    target_y = (value - 1) % 3
                    distance += abs(target_x - i) + abs(target_y - j)
        return distance

    def is_goal(self):
        goal = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]
        return self.board == goal

    def generate_successors(self):
        successors = []
        x, y = self.zero_position

        # Directions: up, down, left, right
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        for dx, dy in directions:
            new_x, new_y = x + dx, y + dy
            if 0 <= new_x < 3 and 0 <= new_y < 3:
                new_board = [row[:] for row in self.board]
                new_board[x][y], new_board[new_x][new_y] = new_board[new_x][new_y], new_board[x][y]
                successors.append(PuzzleState(new_board, self.moves + 1, self))

        return successors

    def __lt__(self, other):
        return (self.moves + self.manhattan_distance) < (other.moves + other.manhattan_distance)

    def reconstruct_path(self):
        path = []
        state = self
        while state is not None:
            path.append(state)
            state = state.previous
        return path[::-1]

def solve_8_puzzle(initial_board):
    initial_state = PuzzleState(initial_board)
    priority_queue = []
    heapq.heappush(priority_queue, initial_state)
    visited = set()

    while priority_queue:
        current_state = heapq.heappop(priority_queue)

        if current_state.is_goal():
            return current_state.reconstruct_path()

        visited.add(tuple(map(tuple, current_state.board)))

        for successor in current_state.generate_successors():
            if tuple(map(tuple, successor.board)) not in visited:
                heapq.heappush(priority_queue, successor)

    return None

def print_solution(path):
    for step, state in enumerate(path):
        print(f"Step {step}:")
        for row in state.board:
            print(row)
        print("")

# Example initial state (can be changed)
initial_board = [
    [1, 2, 3],
    [4, 0, 5],
    [7, 8, 6]
]

solution_path = solve_8_puzzle(initial_board)

if solution_path:
    print_solution(solution_path)
else:
    print("No solution found.")
