from django.db import models

class Student(models.Model):
    first_name = models.TextField()
    last_name = models.TextField()
    age = models.IntegerField()
    def __str__(self):
        return str(self.first_name) + ' ' + str(self.last_name)

 