class Vehicle:
    def __init__(self, make, model):
        self.make = make
        self.model = model

    def description(self):
        return f"{self.make} {self.model}"

class Car(Vehicle):
    def description(self):
        return f"Car: {self.make} {self.model}"

# Usage
my_car = Car("Toyota", "Corolla")
print(my_car.description())
