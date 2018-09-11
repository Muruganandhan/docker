from django.conf.urls import url

from .views import register

urlpatterns = [
    url(r'^sample/$', register, name="register"),
]
