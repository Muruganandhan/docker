from django.contrib import messages
from django.shortcuts import render


# Create your views here.
from django.views.decorators.csrf import csrf_exempt

from dok.dk.models import Sample


@csrf_exempt
def register(request, *args, **kwargs):

    if request.method == "POST":
        name = request.POST.get("name")
        Sample.objects.create(name=name)
        print(name)
        messages.success(request, "Success")
    return render(request, "base.html", {})
