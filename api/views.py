# from django.http import JsonResponse
from turtle import end_fill
from .models import Student
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from  .forms import StudentForm
def api_home(request, *args, **kwargs):
    students = Student.objects.all()
    context = { 'data': students }
    return render(request, 'homepage.html', context)

@csrf_exempt
def create_student(request):

    if request.method == 'GET':
        form = StudentForm()
        return render(request, 'student_form.html', { 'form': form })
    elif request.method == 'POST':
        form = StudentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/api/')

    
        