from django.http import HttpResponse
from django.shortcuts import render
from django.http import JsonResponse

def index(request):
    return render(request, "index.html")

# def index(request):
#     return HttpResponse('it works')

def api(request):
    return JsonResponse({"message": 'It works!'})