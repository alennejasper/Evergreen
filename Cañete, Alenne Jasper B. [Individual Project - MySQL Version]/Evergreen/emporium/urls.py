from django.urls import path
from . import views

urlpatterns = [
    path("", views.emporium, name = "emporium"),
    path("access/", views.access, name = "access"),
    path("exit/", views.exit, name = "exit"),
    path("register/", views.register, name = "register"),
    path("<int:id>", views.exploration, name = "exploration"),
    path("indoors/", views.indoors, name = "indoors"),
    path("outdoors/", views.outdoors, name = "outdoors"),
    path("basket/", views.basket, name = "basket"),
    path("purchase/", views.purchase, name = "purchase"),
    path("transaction/", views.transaction, name = "transaction"),
    path("rendition/", views.rendition, name = "rendition"),
    path("mechanism/", views.mechanism, name = "mechanism"),
    path("overall/", views.overall, name = "overall"),
    path("altogether/", views.altogether, name = "altogether"),
    path("monetary/", views.monetary, name = "monetary"),
    path("fragment/", views.fragment, name = "fragment"),
    path("shipment/", views.shipment, name = "shipment"),
    path("whole/", views.whole, name = "whole"),
    path("trade/", views.trade, name = "trade"),
    path("particle/", views.particle, name = "particle"),
]