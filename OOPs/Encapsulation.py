class Student:
    def __init__(self, name, grade):
        self.__name = name 
        self.__grade = grade 

    def get_grade(self):
        return self.__grade

    def set_grade(self, grade):
        if 0 <= grade <= 100:
            self.__grade = grade
        else:
            print("Invalid grade")


student = Student("John", 85)
print(student.get_grade())
student.set_grade(90)
print(student.get_grade())
