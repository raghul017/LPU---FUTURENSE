def Calculate_area(shape, dimensions):
    if shape == "rectangle":
        length = dimensions["length"]
        width = dimensions["width"]
        area = length * width
    elif shape == "circle":
        radius = dimensions["radius"]
        area = 3.14159 * radius * radius
    elif shape == "triangle":
        length = dimensions["length"]
        width = dimensions["width"]
        heigth = dimensions["heigth"]
        area = length * width * heigth
    elif shape == "square":
        side = dimensions["side"]
        area = side * side

    return area


print(
    "The area of rectangle : ", Calculate_area("rectangle", {"length": 5, "width": 3})
)
print("The area of the circle : ", Calculate_area("circle", {"radius": 5}))

print(
    "The area of the triangle : ",
    Calculate_area("triangle", {"length": 5, "width": 3, "heigth": 7}),
)

print("The area of the square : ", Calculate_area("square", {"side": 5}))
