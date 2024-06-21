# 1 - Unpacking a nested tuple and performing operations:

nested_tuple = (1, (2, 3), (4, 5, 6), 7)
a, (b, c), d, e = nested_tuple
result = (a * b, b + c, e - a)
print("Result of operations:", result)

# 2 - Using zip function to combine multiple tuples into a single list of tuples:

names = ("Alice", "Bob", "Charlie")
scores = (85, 90, 75)
grades = ("A", "A", "B")
combined_data = list(zip(names, scores, grades))
print("Combined data:", combined_data)

# 3 - Using namedtuple to define a data structure:

from collections import namedtuple

Point = namedtuple("Point", ["x", "y"])

p1 = Point(1, 2)
p2 = Point(3, 4)

distance = ((p2.x - p1.x) ** 2 + (p2.y - p1.y) ** 2) ** 0.5
print("Distance between p1 and p2:", distance)
