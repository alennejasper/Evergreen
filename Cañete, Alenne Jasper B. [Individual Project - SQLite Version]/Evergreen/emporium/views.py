from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse, HttpResponse
from django.db.models import Sum, F, Count, Q
from django.core.mail import EmailMessage
from django.conf import settings
from django.template.loader import get_template
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages, admin
from xhtml2pdf import pisa
from io import BytesIO
from re import template
from .models import *
from .forms import registration

import json
import datetime

# Create your views here.
def access(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        account = authenticate(request, username = username, password = password)

        if account is not None:
            if account.is_superuser == True:
                login(request, account)
                return redirect("admin:index")

            elif account.is_customer == True:
                login(request, account)
                return redirect("emporium")
            
            elif account.is_analyst == True:
                login(request, account)
                return redirect("overall")

        else:
            messages.info(request, "Either the username or the password is imprecise.")

    context = {}
    return render(request, "emporium/access.html", context)

def exit(request):
    logout(request)
    return redirect("emporium")

def register(request):
    form = registration()

    if request.method == "POST":
        form = registration(request.POST)

        if form.is_valid():
            account = form.save()
            username = form.cleaned_data.get("username")
            Account.objects.create(user = account, user_name = account.username, first_name = account.first_name, last_name = account.last_name, electronic_mail = account.email)
            messages.success(request, "A personal record was generated for " + username + " today.")
            return redirect("access")  
        
        else:
            messages.error(request, "Both passwords that were entered just now is incorrect; such needs to be different, alphanumeric, and embraces atleast 8 figures.")
            messages.error(request, form.errors)  

    else:
        form = registration()

    context = {"form" :form}
    return render(request, "emporium/register.html", context)

def emporium(request):
    information = guidance(request)
    basket_items = information["basket_items"]
    purchase = information["purchase"]
    items = information["items"]

    items = Item.objects.all()
    context = {"items" :items, "basket_items" :basket_items}
    return render(request, "emporium/emporium.html", context)

def indoors(request):
    information = guidance(request)
    basket_items = information["basket_items"]
    purchase = information["purchase"]
    items = information["items"]

    items = Item.objects.all()
    indoors_linkage = Item.objects.all().filter(item_catalogue__iexact = "indoors")
    outdoors_linkage = Item.objects.filter(item_catalogue__iexact = "outdoors")

    context = {"indoors" :indoors_linkage, "outdoors"  :outdoors_linkage, "items" :items, "basket_items" :basket_items}
    return render(request, "emporium/indoors.html", context)

def outdoors(request):
    information = guidance(request)
    basket_items = information["basket_items"]
    purchase = information["purchase"]
    items = information["items"]
    
    items = Item.objects.all()
    indoors_linkage = Item.objects.all().filter(item_catalogue__iexact = "indoors")
    outdoors_linkage = Item.objects.filter(item_catalogue__iexact = "outdoors")

    context = {"indoors" :indoors_linkage, "outdoors"  :outdoors_linkage, "items" :items, "basket_items" :basket_items}
    return render(request, "emporium/outdoors.html", context)

def exploration(request, id): 
    items = Item.objects.filter(pk = id)
    information = guidance(request)
    basket_items = information["basket_items"]

    context = {"items" :items, "basket_items": basket_items}
    return render(request, "emporium/exploration.html", context)

@login_required(login_url = "access")
def basket(request):
    information = guidance(request)
    basket_items = information["basket_items"]
    purchase = information["purchase"]
    items = information["items"]

    context = {"items" :items, "purchase" :purchase, "basket_items" :basket_items}
    return render(request, "emporium/basket.html", context)

@login_required(login_url = "access")
def purchase(request):
    information = guidance(request)
    basket_items = information["basket_items"]
    purchase = information["purchase"]
    items = information["items"]

    context = {"items" :items, "purchase" :purchase, "basket_items" :basket_items}
    return render(request, "emporium/purchase.html", context)

@login_required(login_url = "access")
def transaction(request):
    information = guidance(request)
    basket_items = information["basket_items"]
    account = request.user.account
    processed = Order.objects.filter(purchase__account = account, purchase__order_status = "Processed").aggregate(amount = Count("purchase__order_status")) ["amount"]
    shipped = Order.objects.filter(purchase__account = account, purchase__order_status = "Shipped").aggregate(amount = Count("purchase__order_status")) ["amount"]
    delivered = Order.objects.filter(purchase__account = account, purchase__order_status = "Delivered").aggregate(amount = Count("purchase__order_status")) ["amount"]
    failed = Order.objects.filter(purchase__account = account, purchase__order_status = "Failed").aggregate(amount = Count("purchase__order_status")) ["amount"]
    orders = Order.objects.filter(purchase__account = account).aggregate(amount = Sum("purchase_amount")) ["amount"]
    overall = Order.objects.filter(purchase__account = account).aggregate(amount = Sum(F("item__item_price") * F("purchase_amount"))) ["amount"]
    purchases = Order.objects.filter(purchase__account = account)

    context = {"basket_items" :basket_items, "processed" :processed, "shipped" :shipped, "delivered" :delivered, "failed" :failed, "orders" :orders, "overall" :overall, "purchases" :purchases}
    return render(request, "emporium/transaction.html", context)

def rendition(request):
    information = json.loads(request.body)
    item_id = information["item_id"]
    item_action = information["item_action"]

    print("item_action:", item_action)
    print("item_id:", item_id)

    account = request.user.account
    item = Item.objects.get(id = item_id)
    purchase, created = Purchase.objects.get_or_create(account = account, order_completion = False)    
    order, created = Order.objects.get_or_create(purchase = purchase, item = item)

    if item_action == "append":
        order.purchase_amount = (order.purchase_amount + 1)
        item.item_quantity = item.item_quantity - 1
    
    elif item_action == "banish":
        order.purchase_amount = (order.purchase_amount - 1)
        item.item_quantity = item.item_quantity + 1

    order.save()
    item.save()

    if order.purchase_amount <= 0:
        order.delete()

    return JsonResponse("the item was appended.", safe = False)

def mechanism(request):
    order_voucher = datetime.datetime.now().timestamp()
    information = json.loads(request.body)

    if request.user.is_authenticated:
        account = request.user.account
        purchase, created = Purchase.objects.get_or_create(account = account, order_completion = False)  
        order = Order.objects.filter(purchase = purchase)

    else:
        account, purchase = anonymous(request, information)

    total = float(information["formation"] ["total"])
    purchase.order_voucher = order_voucher

    if total == purchase.basket_total:
        purchase.order_completion = True
    purchase.save()

    if purchase.delivery == True:
        Delivery.objects.create(
            account = account,
            purchase = purchase,
            phone_number = information["delivery"] ["phone_number"],
            purok_name = information["delivery"] ["purok_name"],
            barangay_name = information["delivery"] ["barangay_name"],
            municipality_name = information["delivery"] ["municipality_name"],
        )

        template_path = "emporium/letterbox.html"

        context = {
            "customer": request.user.account.user_name,
            "date": datetime.datetime.now(),
            "orders": order,
            "total": purchase.basket_total,
            "delivery": datetime.datetime.now() + datetime.timedelta(days = 3),
        }

        template = get_template(template_path)
        body = template.render(context)

        email = EmailMessage(
            "Evergreen's Emporium Letterbox conveyed to you a vital message!",
            body,
            "Evergreen's Emporium Postcard <settings.EMAIL_HOST_USER>",
            [request.user.account.electronic_mail],
        )

        email.fail_silently = False
        email.send()
        
    return JsonResponse("the purchase completed just now.", safe = False)

def cookies(request):
    try:
        basket = json.loads(request.COOKIES["basket"])

    except:
        basket = {}
        print("Basket:", basket)

    items = []
    purchase = {"basket_total" :0, "basket_amount" :0, "delivery" :True}
    basket_items = purchase["basket_amount"]
        
    for index in basket:
        try:
            basket_items += basket[index] ["purchase_amount"]

            item = Item.objects.get(id = index)
            total = (item.item_price * basket[index] ["purchase_amount"])

            purchase["basket_total"] += total
            purchase["basket_amount"] += basket[index] ["purchase_amount"]

            item = {
                "item": {
                    "id": item.id,
                    "item_name": item.item_name,
                    "item_price": item.item_price,
                    "image_url": item.image_url,

                    },
                "purchase_amount": basket[index] ["purchase_amount"],
                "total": total,

                }
            items.append(item)

            figure = {
                "item": {
                    "id": item.id,
                    "item_name": item.item_name,
                    "item_price": item.item_price,
                    "image_url": item.image_url,

                    },
                "purchase_amount": basket[index] ["purchase_amount"],
                "total": total,

                }
            items.append(figure)

            if item.item_quantity > 0:
                purchase["delivery"] = True
            
        except:
            pass
        
    return{"basket_items": basket_items, "purchase": purchase, "items": items}

def guidance(request):
    if request.user.is_authenticated:
        account = request.user.account
        purchase, created = Purchase.objects.get_or_create(account = account, order_completion = False)
        items = purchase.order_set.all()
        basket_items = purchase.basket_amount

    else:
        cookie_information = cookies(request)
        basket_items = cookie_information["basket_items"]
        purchase = cookie_information["purchase"]
        items = cookie_information["items"]

    return{"basket_items": basket_items, "purchase": purchase, "items": items}

def anonymous(request, information):
    print("the user did not registered herein.")

    print("Cookies:", request.COOKIES)
    user_name = information["formation"] ["user_name"]
    first_name = information["formation"] ["first_name"]
    last_name = information["formation"] ["last_name"]
    electronic_mail = information["formation"] ["electronic_mail"]

    cookie_information = cookies(request)
    items = cookie_information["items"]

    account, created = Account.objects.get_or_create(
        electronic_mail = electronic_mail,

        )
    account.user_name = user_name
    account.first_name = first_name
    account.last_name = last_name
    account.save()

    purchase = Purchase.objects.create(
        account = account,
        order_completion = False,
        )

    for item in items:
        item = Item.objects.get(id = item["item"] ["id"])

        order = Order.objects.create(
            item = item,
            purchase = purchase,
            )
    
    for figure in items:
        order = Order.objects.create(
            item = item,
            purchase = purchase,
            purchase_amount = figure["purchase_amount"],
            )
            
    return account, purchase

@login_required(login_url = "access")
def overall(request):
    tag = []
    information = []

    sales = Report.objects.filter(purchase__order_completion = True).order_by("purchase_amount")

    for item in sales:
        tag.append(item.item.item_name)
        information.append(item.purchase_amount)

    context = {
        "purchases": Report.objects.filter(purchase__order_completion = True).order_by("-purchase_date"),
        "orders": Report.objects.filter(purchase__order_completion = True).aggregate(amount = Sum("purchase_amount")) ["amount"],
        "overall": Report.objects.filter(purchase__order_completion = True).aggregate(amount = Sum(F("item__item_price") * F("purchase_amount"))) ["amount"],
        "customer": Transaction.objects.filter(account__user__is_customer = True).aggregate(amount = Count("account__user__is_customer", distinct = True)) ["amount"],
        "tag": tag,
        "information": information,
    }

    return render(request, "emporium/overall.html", context)

def altogether(request):    
    template_path = "emporium/report.html"
    context = {
        "purchases": Report.objects.filter(purchase__order_completion = True).order_by("-purchase_date"),        
        "orders": Report.objects.filter(purchase__order_completion = True).aggregate(amount = Sum("purchase_amount")) ["amount"],
        "overall": Report.objects.filter(purchase__order_completion = True).aggregate(amount = Sum(F("item__item_price") * F("purchase_amount"))) ["amount"],
        "customer": Transaction.objects.filter(account__user__is_customer = True).aggregate(amount = Count("account__user__is_customer", distinct = True)) ["amount"],
    }
    
    response = HttpResponse(content_type = "application/pdf")
    filename = "report.pdf"
    content = "attachment; filename = %s" %(filename)
    response["Content-Disposition"] = content
    
    template = get_template(template_path)
    html = template.render(context)

    pisa_status = pisa.CreatePDF(
        html, dest = response
    )

    if pisa_status.err:
        return HttpResponse("Sorry, the emporium observed a few errors.")
    return response

@login_required(login_url = "access")
def monetary(request):
    if request.method == "GET":
        origin = request.GET.get("origin")
        request.session["origin"] = origin
        epilogue = request.GET.get("epilogue")
        request.session["epilogue"] = epilogue

    tag = []
    information = []

    sales = Report.objects.filter(purchase_date__range = [origin, epilogue], purchase__order_completion = True).order_by("purchase_amount")

    for item in sales:
        tag.append(item.item.item_name)
        information.append(item.purchase_amount)

    context = {
        "purchases": Report.objects.filter(purchase_date__range = [origin, epilogue], purchase__order_completion = True),
        "orders": Report.objects.filter(purchase_date__range = [origin, epilogue], purchase__order_completion = True).aggregate(amount = Sum("purchase_amount")) ["amount"],
        "overall": Report.objects.filter(purchase_date__range = [origin, epilogue], purchase__order_completion = True).aggregate(amount = Sum(F("item__item_price") * F("purchase_amount"))) ["amount"],
        "customer": Transaction.objects.filter(order_date__range = [origin, epilogue], account__user__is_customer = True).aggregate(amount = Count("account__user__is_customer", distinct = True)) ["amount"], 
        "tag": tag,
        "information": information,  
    }

    return render(request, "emporium/monetary.html", context)

def fragment(request):    
    template_path = "emporium/report.html"

    origin = request.session.get("origin")
    epilogue = request.session.get("epilogue")

    context = {
        "purchases": Report.objects.filter(purchase_date__range = [origin, epilogue], purchase__order_completion = True),
        "orders": Report.objects.filter(purchase_date__range = [origin, epilogue], purchase__order_completion = True).aggregate(amount = Sum("purchase_amount")) ["amount"],
        "overall": Report.objects.filter(purchase_date__range = [origin, epilogue], purchase__order_completion = True).aggregate(amount = Sum(F("item__item_price") * F("purchase_amount"))) ["amount"],
        "customer": Transaction.objects.filter(order_date__range = [origin, epilogue], account__user__is_customer = True).aggregate(amount = Count("account__user__is_customer", distinct = True)) ["amount"],
    }
    
    response = HttpResponse(content_type = "application/pdf")
    filename = "report.pdf"
    content = "attachment; filename = %s" %(filename)
    response["Content-Disposition"] = content
    
    template = get_template(template_path)
    html = template.render(context)

    pisa_status = pisa.CreatePDF(
        html, dest = response
    )

    if pisa_status.err:
        return HttpResponse("Sorry, the emporium observed a few errors.")
    return response

@login_required(login_url = "access")
def shipment(request):
    tag = []
    information = []

    dispatches = Shipment.objects.filter(purchase__order_completion = True).distinct().order_by("municipality_name")
    overall = Shipment.objects.filter(purchase__order_completion = True)

    for item in dispatches:
        tag.append(item.municipality_name)   

    for item in overall: 
        information.append(item.overall)

    context = {
        "deliveries": Shipment.objects.filter(purchase__order_completion = True),
        "overall": Shipment.objects.filter(purchase__order_completion = True).aggregate(amount = Count("purchase__order_completion")) ["amount"],
        "success": Shipment.objects.filter(purchase__order_status__icontains = "Delivered").aggregate(amount = Count("purchase__order_status")) ["amount"],
        "failure": Shipment.objects.filter(purchase__order_status__icontains = "Failed").aggregate(amount = Count("purchase__order_status")) ["amount"],
        "tag": tag,
        "information": information,
    }

    return render(request, "emporium/shipment.html", context)

def whole(request):    
    template_path = "emporium/record.html"
    
    context = {
        "deliveries": Shipment.objects.filter(purchase__order_completion = True),
        "overall": Shipment.objects.filter(purchase__order_completion = True).aggregate(amount = Count("purchase__order_completion")) ["amount"],
        "success": Shipment.objects.filter(purchase__order_status__icontains = "Delivered").aggregate(amount = Count("purchase__order_status")) ["amount"],
        "failure": Shipment.objects.filter(purchase__order_status__icontains = "Failed").aggregate(amount = Count("purchase__order_status")) ["amount"],
    }
    
    response = HttpResponse(content_type = "application/pdf")
    filename = "record.pdf"
    content = "attachment; filename = %s" %(filename)
    response["Content-Disposition"] = content
    
    template = get_template(template_path)
    html = template.render(context)

    pisa_status = pisa.CreatePDF(
        html, dest = response
    )

    if pisa_status.err:
        return HttpResponse("Sorry, the emporium observed a few errors.")
    return response

@login_required(login_url = "access")
def trade(request):
    if request.method == "GET":
        origin = request.GET.get("origin")
        request.session["origin"] = origin
        epilogue = request.GET.get("epilogue")
        request.session["epilogue"] = epilogue
    
    tag = []
    information = []

    dispatches = Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_completion = True).distinct("account__user_name").order_by("account__user_name")
    overall = Shipment.objects.filter(delivery_date__range = [origin, epilogue], account__user__is_customer = True)

    for item in dispatches:
        tag.append(item.account.user_name)    
    
    for item in overall:
        information.append(item.overall)

    context = {
        "deliveries": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_completion = True),
        "overall": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_completion = True).aggregate(amount = Count("purchase__order_completion")) ["amount"],
        "success": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_status__icontains = "Delivered").aggregate(amount = Count("purchase__order_status")) ["amount"],
        "failure": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_status__icontains = "Failed").aggregate(amount = Count("purchase__order_status")) ["amount"],
        "tag": tag,
        "information": information,
    }

    return render(request, "emporium/trade.html", context)

def particle(request):    
    template_path = "emporium/record.html"

    origin = request.session.get("origin")
    epilogue = request.session.get("epilogue")

    context = {
        "deliveries": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_completion = True),
        "overall": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_completion = True).aggregate(amount = Count("purchase__order_completion")) ["amount"],
        "success": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_status__icontains = "Delivered").aggregate(amount = Count("purchase__order_status")) ["amount"],
        "failure": Shipment.objects.filter(delivery_date__range = [origin, epilogue], purchase__order_status__icontains = "Failed").aggregate(amount = Count("purchase__order_status")) ["amount"],
    }
    
    response = HttpResponse(content_type = "application/pdf")
    filename = "record.pdf"
    content = "attachment; filename = %s" %(filename)
    response["Content-Disposition"] = content
    
    template = get_template(template_path)
    html = template.render(context)

    pisa_status = pisa.CreatePDF(
        html, dest = response
    )

    if pisa_status.err:
        return HttpResponse("Sorry, the emporium observed a few errors.")
    return response