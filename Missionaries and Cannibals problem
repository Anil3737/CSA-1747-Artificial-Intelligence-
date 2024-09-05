from collections import deque

class State:
    def __init__(self, m_left, c_left, m_right, c_right, boat):
        self.m_left = m_left
        self.c_left = c_left
        self.m_right = m_right
        self.c_right = c_right
        self.boat = boat

    def __repr__(self):
        return (f"State(M_left={self.m_left}, C_left={self.c_left}, "
                f"M_right={self.m_right}, C_right={self.c_right}, Boat={self.boat})")

    def is_valid(self):
        # Check if the state is valid
        if (self.m_left < 0 or self.m_left > 3 or
            self.c_left < 0 or self.c_left > 3 or
            self.m_right < 0 or self.m_right > 3 or
            self.c_right < 0 or self.c_right > 3 or
            (self.m_left < self.c_left and self.m_left > 0) or
            (self.m_right < self.c_right and self.m_right > 0)):
            return False
        return True

    def is_goal(self):
        # Check if the goal state is reached
        return self.m_left == 0 and self.c_left == 0

    def get_successors(self):
        successors = []
        if self.boat == 'left':
            for m in range(3):
                for c in range(3):
                    if (m + c >= 1 and m + c <= 2 and
                        m <= self.m_left and c <= self.c_left):
                        new_state = State(self.m_left - m, self.c_left - c,
                                          self.m_right + m, self.c_right + c, 'right')
                        if new_state.is_valid():
                            successors.append(new_state)
        else:
            for m in range(3):
                for c in range(3):
                    if (m + c >= 1 and m + c <= 2 and
                        m <= self.m_right and c <= self.c_right):
                        new_state = State(self.m_left + m, self.c_left + c,
                                          self.m_right - m, self.c_right - c, 'left')
                        if new_state.is_valid():
                            successors.append(new_state)
        return successors

def bfs():
    start = State(3, 3, 0, 0, 'left')
    goal = State(0, 0, 3, 3, 'right')
    
    queue = deque([start])
    visited = set()
    parent_map = {start: None}

    while queue:
        current = queue.popleft()
        
        if current.is_goal():
            path = []
            while current is not None:
                path.append(current)
                current = parent_map[current]
            return path[::-1]
        
        visited.add(current)
        
        for next_state in current.get_successors():
            if next_state not in visited and next_state not in queue:
                queue.append(next_state)
                parent_map[next_state] = current
                
    return None

def print_solution(path):
    if path:
        for step in path:
            print(step)
            print()
    else:
        print("No solution found.")

# Example Usage
solution_path = bfs()
print_solution(solution_path)
