# 1 - Performing set operations:

set1 = {1, 2, 3, 4, 5}
set2 = {3, 4, 5, 6, 7}

union_set = set1 | set2
print("Union of sets:", union_set)

intersection_set = set1 & set2
print("Intersection of sets:", intersection_set)

difference_set = set1 - set2
print("Set difference:", difference_set)

symmetric_difference_set = set1 ^ set2
print("Symmetric difference of sets:", symmetric_difference_set)

# 2 -Using set comprehensions to create a set of squared numbers:

original_set = {1, 2, 3, 4, 5}
squared_set = {x**2 for x in original_set}
print("Set of squared numbers:", squared_set)


# 3 - Checking for subsets and supersets:

set1 = {1, 2, 3}
set2 = {1, 2}
set3 = {1, 2, 3, 4}

print("Is set2 a subset of set1?", set2.issubset(set1))
print("Is set1 a superset of set2?", set1.issuperset(set2))
print("Is set3 a superset of set1?", set3.issuperset(set1))
