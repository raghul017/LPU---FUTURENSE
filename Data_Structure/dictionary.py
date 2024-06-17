# 1 - Creating a dictionary and accessing its elements:


my_dict = {"name": "Alice", "age": 25, "city": "New York"}

print("Name:", my_dict["name"])
print("Age:", my_dict["age"])
print("Keys:", my_dict.keys())
print("Values:", my_dict.values())

# 2 -Modifying a dictionary by adding and updating key-value pairs:


my_dict = {"name": "Alice", "age": 25, "city": "New York"}

my_dict["email"] = "alice@example.com"

my_dict["age"] = 26

print("Modified dictionary:", my_dict)

# 3 - Iterating over a dictionary and performing operations:

my_dict = {"apple": 2, "banana": 3, "orange": 5}


total_cost = 0
for fruit, price in my_dict.items():
    total_cost += price

print("Total cost of fruits:", total_cost)
