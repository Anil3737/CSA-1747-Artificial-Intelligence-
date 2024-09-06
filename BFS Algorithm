import itertools

def tsp(cities):
    
    permutations = list(itertools.permutations(cities))
    
   
    shortest_distance = float('inf')
    shortest_route = None
    for route in permutations:
        total_distance = 0
        for i in range(len(route) - 1):
            total_distance += distance(route[i], route[i + 1])
        total_distance += distance(route[-1], route[0])
        
       
        if total_distance < shortest_distance:
            shortest_distance = total_distance
            shortest_route = route
    
    return shortest_route, shortest_distance

def distance(city1, city2):

    return ((city2[0] - city1[0]) ** 2 + (city2[1] - city1[1]) ** 2) ** 0.5


cities = [(0, 0), (1, 2), (3, 1), (4, 4), (2, 3)]
shortest_route, shortest_distance = tsp(cities)
print("Shortest route:", shortest_route)
print("Shortest distance:", shortest_distance)
