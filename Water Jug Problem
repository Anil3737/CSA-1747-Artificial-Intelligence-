from collections import deque

def is_goal(state, target):
    return state[0] == target or state[1] == target

def bfs_solve(jug1_capacity, jug2_capacity, target):
    # To keep track of visited states
    visited = set()
    # Queue for BFS, initialized with the starting state (0, 0)
    queue = deque([(0, 0)])
    # To store the path
    path = []

    while queue:
        current_state = queue.popleft()
        
        if current_state in visited:
            continue

        path.append(current_state)
        visited.add(current_state)

        # If the target is reached
        if is_goal(current_state, target):
            return path

        jug1, jug2 = current_state

        # Possible states to move to
        next_states = [
            (jug1_capacity, jug2),             # Fill Jug1
            (jug1, jug2_capacity),             # Fill Jug2
            (0, jug2),                         # Empty Jug1
            (jug1, 0),                         # Empty Jug2
            (min(jug1_capacity, jug1 + jug2),  # Pour Jug2 into Jug1
             jug2 - (min(jug1_capacity - jug1, jug2))),
            (jug1 - (min(jug1, jug2_capacity - jug2)),  # Pour Jug1 into Jug2
             min(jug2_capacity, jug1 + jug2))
        ]

        for state in next_states:
            if state not in visited:
                queue.append(state)

    return None

def print_solution(path):
    for step, state in enumerate(path):
        print(f"Step {step}: Jug1 = {state[0]}L, Jug2 = {state[1]}L")
    print("")

# Example Usage
jug1_capacity = 4  # Capacity of the first jug
jug2_capacity = 3  # Capacity of the second jug
target = 2         # Target amount of water

solution_path = bfs_solve(jug1_capacity, jug2_capacity, target)

if solution_path:
    print_solution(solution_path)
else:
    print("No solution found.")
