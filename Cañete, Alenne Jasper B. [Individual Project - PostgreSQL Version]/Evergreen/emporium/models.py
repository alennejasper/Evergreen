from msilib.schema import Property
from django.db import models, connection
from django.contrib.auth.models import User, AbstractUser

import datetime

# Create your models here.

class User(AbstractUser):
    is_customer = models.BooleanField(default = False, help_text = "Designates whether the user can log into the site for item purchase.", verbose_name = "Customer status")
    is_analyst = models.BooleanField(default = False, help_text = "Designates whether the user can log into the site for sales analysis.", verbose_name = "Analyst status")

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"
    
    def __str__(self):
        return self.username + " // permissions assigned to user throughout the repository!"

class Account(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE, null = True, blank = True, verbose_name = "User")
    user_name = models.CharField(max_length = 125, null = True, blank = True, verbose_name = "User Name")
    first_name = models.CharField(max_length = 65, null = True, blank = True, verbose_name = "First Name")
    last_name = models.CharField(max_length = 65, null = True, blank = True, verbose_name = "Last Name")
    electronic_mail = models.CharField(max_length = 65, null = True, verbose_name = "Electronic Mail")

    class Meta:
        verbose_name = "Account"
        verbose_name_plural = "Accounts"
        indexes = [models.Index(fields = ["user_name",])]

    def __str__(self):
        return self.user_name + " // user assigned upon the repository!"

class Item(models.Model):
    item_name = models.CharField(max_length = 125, null = True, verbose_name = "Item Name")
    item_description = models.TextField (max_length = 1500, null = True, blank = True, verbose_name = "Item Description")
    item_price = models.DecimalField(max_digits = 5, decimal_places = 2, verbose_name = "Item Price")
    item_quantity = models.IntegerField(default = 0, null = True, blank = True, verbose_name = "Item Quantity")
    item_image = models.ImageField(null = True, blank = True, verbose_name = "Item Image")
    item_catalogue = models.CharField(max_length = 125, null = True, blank = True, verbose_name = "Item Catalogue")

    class Meta:
        verbose_name = "Item"
        verbose_name_plural = "Items"
        indexes = [models.Index(fields = ["item_name",])]

    def __str__(self):
        return self.item_name + " // marketed upon the emporium!"
    
    @property
    def image_url(self):
        try:
            url = self.item_image.url

        except:
            url = ""
        return url

class Purchase(models.Model):
    status = (("Processed", "Processed"), ("Shipped", "Shipped"), ("Delivered", "Delivered"), ("Failed", "Failed"))
    account = models.ForeignKey(Account, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Account")
    order_date = models.DateTimeField(default = datetime.datetime.now(), verbose_name = "Order Date")
    order_completion = models.BooleanField(default = True, null = True, blank = True, verbose_name = "Order Completion")
    order_voucher = models.CharField(default = datetime.datetime.now().timestamp(), max_length = 20, null = True, verbose_name = "Order Voucher")
    order_status = models.CharField(default = "Processed", null = True, blank = True, max_length = 20, choices = status, verbose_name = "Order Status")

    class Meta:
        verbose_name = "Purchase"
        verbose_name_plural = "Purchases"

    def __str__(self):
        if self.order_completion == True:
            return str(self.id) + " // " + " fulfilled queued status upon the repository from " + str(self.account.user_name) + "!"
        
        else:
            return str(self.id) + " // " + " neglected queued status upon the repository from " + str(self.account.user_name) + "!"
        
    @property
    def delivery(self):
        delivery = True
        order = self.order_set.all()

        for index in order:
            if index.item.item_quantity == 0:
                delivery = False
        return delivery

    @property
    def basket_total(self):
        order = self.order_set.all()
        total = sum([item.total for item in order])
        return total
    
    @property
    def basket_amount(self):
        order = self.order_set.all()
        total = sum([item.purchase_amount for item in order])
        return total

class Order(models.Model):
    item = models.ForeignKey(Item, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Item")
    purchase = models.ForeignKey(Purchase, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Purchase")
    purchase_amount = models.IntegerField(default = 0, null = True, blank = True, verbose_name = "Purchase Amount")
    purchase_date = models.DateTimeField(default = datetime.datetime.now(), verbose_name = "Purchase Date")

    class Meta:
        verbose_name = "Order"
        verbose_name_plural = "Orders"

    def __str__(self):
        return str(self.purchase_amount) + " // amount of item chosen by " + str(self.purchase.account.user_name) + "!"

    @property
    def total(self):
        total = self.item.item_price * self.purchase_amount
        return total

    @property
    def overall(self):
        overall = sum(self.item.item_price * self.purchase_amount)
        return overall

class Delivery(models.Model):
    account = models.ForeignKey(Account, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Account")
    purchase = models.ForeignKey(Purchase, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Purchase")
    phone_number = models.CharField(max_length = 11, null = True, verbose_name = "Phone Number")
    purok_name = models.CharField(max_length = 50, null = True, verbose_name = "Purok Name")
    barangay_name = models.CharField(max_length = 50, null = True, verbose_name = "Barangay Name")
    municipality_name = models.CharField(max_length = 50, null = True, verbose_name = "Municipality Name")
    delivery_date = models.DateField(default = datetime.datetime.now() + datetime.timedelta(days = 3), verbose_name = "Delivery Date")

    class Meta:
        verbose_name = "Delivery"
        verbose_name_plural = "Deliveries"
        indexes = [models.Index(fields = ["phone_number",])]

    def __str__(self):
        return self.municipality_name + " // area of delivery chosen by " + str(self.account.user_name) + "!"
    
    @property
    def overall(self):
        census = Delivery.objects.filter(purchase__order_completion = True).aggregate(amount = models.Count("municipality_name", distinct = True)) ["amount"]
        overall = Delivery.objects.filter(purchase__order_completion = True).aggregate(amount = models.Sum(census)) ["amount"]
        return overall

class Transaction(models.Model):
    account = models.ForeignKey(Account, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Account")
    order_date = models.DateTimeField(default = datetime.datetime.now(), verbose_name = "Order Date")
    order_completion = models.BooleanField(default = True, null = True, blank = True, verbose_name = "Order Completion")
    order_voucher = models.CharField(default = datetime.datetime.now().timestamp(), max_length = 20, null = True, verbose_name = "Order Voucher")
    order_status = models.CharField(default = "Processed", null = True, blank = True, max_length = 20, choices = (("Processed", "Processed"), ("Shipped", "Shipped"), ("Delivered", "Delivered"), ("Failed", "Failed")), verbose_name = "Order Status")

    class Meta:
        verbose_name = "Transaction"
        verbose_name_plural = "Transactions"
        managed = False
        db_table = "emporium_purchase_view"

    def __str__(self):
        if self.order_completion == True:
            return str(self.id) + " // " + " fulfilled status upon the repository from " + str(self.account.user_name) + "!"
        
        else:
            return str(self.id) + " // " + " neglected status upon the repository from " + str(self.account.user_name) + "!"

class Report(models.Model):
    item = models.ForeignKey(Item, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Item")
    purchase = models.ForeignKey(Purchase, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Purchase")
    purchase_amount = models.IntegerField(default = 0, null = True, blank = True, verbose_name = "Purchase Amount")
    purchase_date = models.DateTimeField(default = datetime.datetime.now(), verbose_name = "Purchase Date")

    class Meta:
        verbose_name = "Report"
        verbose_name_plural = "Reports"
        managed = False
        db_table = "emporium_order_view"

    def __str__(self):
        return str(self.purchase_amount) + " // reported amount of item chosen by " + str(self.purchase.account.user_name) + "!"
    
    @property
    def total(self):
        total = self.item.item_price * self.purchase_amount
        return total

class Shipment(models.Model):
    account = models.ForeignKey(Account, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Account")
    purchase = models.ForeignKey(Purchase, on_delete = models.SET_NULL, blank = True, null = True, verbose_name = "Purchase")
    phone_number = models.CharField(max_length = 11, null = True, verbose_name = "Phone Number")
    purok_name = models.CharField(max_length = 50, null = True, verbose_name = "Purok Name")
    barangay_name = models.CharField(max_length = 50, null = True, verbose_name = "Barangay Name")
    municipality_name = models.CharField(max_length = 50, null = True, verbose_name = "Municipality Name")
    delivery_date = models.DateField(default = datetime.datetime.now() + datetime.timedelta(days = 3), verbose_name = "Delivery Date")

    class Meta:
        verbose_name = "Delivery"
        verbose_name_plural = "Deliveries"
        managed = False
        db_table = "emporium_delivery_view"

    def __str__(self):
        return self.municipality_name + " // area of delivery chosen by " + str(self.account.user_name) + "!"
    
    @property
    def overall(self):
        census = Shipment.objects.filter(purchase__order_completion = True).aggregate(amount = models.Count("municipality_name", distinct = True)) ["amount"]
        overall = Shipment.objects.filter(purchase__order_completion = True).aggregate(amount = models.Sum(census)) ["amount"]
        return overall