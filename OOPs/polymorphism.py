class Bird:
    def sound(self):
        return "Some generic bird sound"

class Sparrow(Bird):
    def sound(self):
        return "Chirp"

class Crow(Bird):
    def sound(self):
        return "Caw"


birds = [Sparrow(), Crow()]
for bird in birds:
    print(bird.sound())
