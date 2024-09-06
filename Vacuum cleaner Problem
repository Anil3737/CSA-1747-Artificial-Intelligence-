class VacuumCleaner:
    def __init__(self, grid_size):
        self.grid_size = grid_size
        self.grid = [['dirty' for _ in range(grid_size)] for _ in range(grid_size)]
        self.position = (0, 0)

    def print_grid(self):
        for row in self.grid:
            print(row)
        print()

    def mark_clean(self):
        x, y = self.position
        self.grid[x][y] = 'clean'

    def move_left(self):
        x, y = self.position
        if y > 0:
            self.position = (x, y - 1)

    def move_right(self):
        x, y = self.position
        if y < self.grid_size - 1:
            self.position = (x, y + 1)

    def move_up(self):
        x, y = self.position
        if x > 0:
            self.position = (x - 1, y)

    def move_down(self):
        x, y = self.position
        if x < self.grid_size - 1:
            self.position = (x + 1, y)

    def clean(self):
        while 'dirty' in [cell for row in self.grid for cell in row]:
            self.print_grid()
            if self.grid[self.position[0]][self.position[1]] == 'dirty':
                print(f"Cleaning {self.position}")
                self.mark_clean()
            else:
                print(f"Already clean at {self.position}")

            # Move to the next dirty cell
            if 'dirty' in self.grid[self.position[0]]:
                if self.position[1] < self.grid_size - 1:
                    self.move_right()
                else:
                    self.move_down()
            else:
                if self.position[1] > 0:
                    self.move_left()
                else:
                    self.move_down()


if __name__ == "__main__":
    grid_size = 3  # You can change the grid size as needed
    vacuum = VacuumCleaner(grid_size)
    vacuum.clean()
