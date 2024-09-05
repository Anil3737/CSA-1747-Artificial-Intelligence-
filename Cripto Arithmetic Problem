
import itertools

def solve_cryptarithmetic(word1, word2, word3):
    # Extract unique letters
    letters = set(word1 + word2 + word3)
    
    if len(letters) > 10:
        print("Too many unique letters; cannot solve.")
        return None
    
    # Generate all possible digit assignments for the letters
    for perm in itertools.permutations(range(10), len(letters)):
        letter_to_digit = dict(zip(letters, perm))
        
        # Check for leading zero constraint
        if (letter_to_digit[word1[0]] == 0 or
            letter_to_digit[word2[0]] == 0 or
            letter_to_digit[word3[0]] == 0):
            continue
        
        # Convert words to numbers based on the current assignment
        num1 = int("".join(str(letter_to_digit[letter]) for letter in word1))
        num2 = int("".join(str(letter_to_digit[letter]) for letter in word2))
        num3 = int("".join(str(letter_to_digit[letter]) for letter in word3))
        
        # Check if the current assignment is a valid solution
        if num1 + num2 == num3:
            return letter_to_digit
    
    return None

def print_solution(mapping, word1, word2, word3):
    if mapping:
        num1 = int("".join(str(mapping[letter]) for letter in word1))
        num2 = int("".join(str(mapping[letter]) for letter in word2))
        num3 = int("".join(str(mapping[letter]) for letter in word3))
        
        print(f"{word1} = {num1}")
        print(f"{word2} = {num2}")
        print(f"{word3} = {num3}")
        print(f"{num1} + {num2} = {num3}")
    else:
        print("No solution found.")

# Example Usage
word1 = "SEND"
word2 = "MORE"
word3 = "MONEY"

solution = solve_cryptarithmetic(word1, word2, word3)
print_solution(solution, word1, word2, word3)
