def analyze_list(list):

    minimum = min(list)
    maximum = max(list)
    average = sum(list) / len(list)

    return {"min": minimum, "max": maximum, "average": average}


print(analyze_list([1, 2, 3, 4, 5, 6, 7]))
