def filter_short_names(names, max_length):

    short_names = list(filter(lambda name: len(name) < max_length, names))
    return short_names


product_names = ["apple", "banana", "kiwi", "strawberry", "pear"]
max_length = 6
filtered_names = filter_short_names(product_names, max_length)
print(filtered_names)
