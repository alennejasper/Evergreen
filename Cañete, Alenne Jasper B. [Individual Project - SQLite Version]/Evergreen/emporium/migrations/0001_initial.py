# Generated by Django 4.1.7 on 2023-06-10 07:12

import datetime
from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ("auth", "0012_alter_user_first_name_max_length"),
    ]

    operations = [
        migrations.CreateModel(
            name = "Report",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("purchase_amount", models.IntegerField(blank = True, default = 0, null = True, verbose_name = "Purchase Amount")),
                ("purchase_date", models.DateTimeField(default = datetime.datetime(2023, 6, 10, 15, 12, 57, 740872), verbose_name = "Purchase Date")),
            ],
            options = {
                "verbose_name": "Report",
                "verbose_name_plural": "Reports",
                "db_table": "emporium_order_view",
                "managed": False,
            },
        ),
        migrations.CreateModel(
            name = "Shipment",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("phone_number", models.CharField(max_length = 11, null = True, verbose_name = "Phone Number")),
                ("purok_name", models.CharField(max_length = 50, null = True, verbose_name = "Purok Name")),
                ("barangay_name", models.CharField(max_length = 50, null = True, verbose_name = "Barangay Name")),
                ("municipality_name", models.CharField(max_length = 50, null = True, verbose_name = "Municipality Name")),
                ("delivery_date", models.DateField(default = datetime.datetime(2023, 6, 13, 15, 12, 57, 741869), verbose_name = "Delivery Date")),
            ],
            options = {
                "verbose_name": "Delivery",
                "verbose_name_plural": "Deliveries",
                "db_table": "emporium_delivery_view",
                "managed": False,
            },
        ),
        migrations.CreateModel(
            name = "Transaction",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("order_date", models.DateTimeField(default = datetime.datetime(2023, 6, 10, 15, 12, 57, 740872), verbose_name = "Order Date")),
                ("order_completion", models.BooleanField(blank = True, default = True, null = True, verbose_name = "Order Completion")),
                ("order_voucher", models.CharField(default = 1686381177.740872, max_length = 20, null = True, verbose_name = "Order Voucher")),
                ("order_status", models.CharField(blank = True, choices = [("Processed", "Processed"), ("Shipped", "Shipped"), ("Delivered", "Delivered"), ("Failed", "Failed")], default = "Processed", max_length = 20, null = True, verbose_name = "Order Status")),
            ],
            options = {
                "verbose_name": "Transaction",
                "verbose_name_plural": "Transactions",
                "db_table": "emporium_purchase_view",
                "managed": False,
            },
        ),
        migrations.CreateModel(
            name = "User",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("password", models.CharField(max_length = 128, verbose_name = "password")),
                ("last_login", models.DateTimeField(blank = True, null = True, verbose_name = "last login")),
                ("is_superuser", models.BooleanField(default = False, help_text = "Designates that this user has all permissions without explicitly assigning them.", verbose_name = "superuser status")),
                ("username", models.CharField(error_messages = {"unique": "A user with that username already exists."}, help_text = "Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.", max_length = 150, unique = True, validators = [django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name = "username")),
                ("first_name", models.CharField(blank = True, max_length = 150, verbose_name = "first name " )),
                ("last_name", models.CharField(blank = True, max_length = 150, verbose_name = "last name " )),
                ("email", models.EmailField(blank = True, max_length = 254, verbose_name = "email address")),
                ("is_staff", models.BooleanField(default = False, help_text = "Designates whether the user can log into this admin site.", verbose_name = "staff status")),
                ("is_active", models.BooleanField(default = True, help_text = "Designates whether this user should be treated as active. Unselect this instead of deleting accounts.", verbose_name = "active")),
                ("date_joined", models.DateTimeField(default = django.utils.timezone.now, verbose_name = "date joined")),
                ("is_customer", models.BooleanField(default = False, help_text = "Designates whether the user can log into the site for item purchase.", verbose_name = "Customer status")),
                ("is_analyst", models.BooleanField(default = False, help_text = "Designates whether the user can log into the site for sales analysis.", verbose_name = "Analyst status")),
            ],
            options = {
                "verbose_name": "User",
                "verbose_name_plural": "Users",
            },
            managers = [
                ("objects", django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name = "Account",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("user_name", models.CharField(blank = True, max_length = 125, null = True, verbose_name = "User Name")),
                ("first_name", models.CharField(blank = True, max_length = 65, null = True, verbose_name = "First Name")),
                ("last_name", models.CharField(blank = True, max_length = 65, null = True, verbose_name = "Last Name")),
                ("electronic_mail", models.CharField(max_length = 65, null = True, verbose_name = "Electronic Mail")),
            ],
            options = {
                "verbose_name": "Account",
                "verbose_name_plural": "Accounts",
            },
        ),
        migrations.CreateModel(
            name = "Delivery",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("phone_number", models.CharField(max_length = 11, null = True, verbose_name = "Phone Number")),
                ("purok_name", models.CharField(max_length = 50, null = True, verbose_name = "Purok Name")),
                ("barangay_name", models.CharField(max_length = 50, null = True, verbose_name = "Barangay Name")),
                ("municipality_name", models.CharField(max_length = 50, null = True, verbose_name = "Municipality Name")),
                ("delivery_date", models.DateField(default = datetime.datetime(2023, 6, 13, 15, 12, 57, 739876), verbose_name = "Delivery Date")),
            ],
            options = {
                "verbose_name": "Delivery",
                "verbose_name_plural": "Deliveries",
            },
        ),
        migrations.CreateModel(
            name = "Item",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("item_name", models.CharField(max_length = 125, null = True, verbose_name = "Item Name")),
                ("item_description", models.TextField(blank = True, max_length = 1500, null = True, verbose_name = "Item Description")),
                ("item_price", models.DecimalField(decimal_places = 2, max_digits = 5, verbose_name = "Item Price")),
                ("item_quantity", models.IntegerField(blank = True, default = 0, null = True, verbose_name = "Item Quantity")),
                ("item_image", models.ImageField(blank = True, null = True, upload_to = "", verbose_name = "Item Image")),
                ("item_catalogue", models.CharField(blank = True, max_length = 125, null = True, verbose_name = "Item Catalogue")),
            ],
            options = {
                "verbose_name": "Item",
                "verbose_name_plural": "Items",
            },
        ),
        migrations.CreateModel(
            name = "Purchase",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("order_date", models.DateTimeField(default = datetime.datetime(2023, 6, 10, 15, 12, 57, 738877), verbose_name = "Order Date")),
                ("order_completion", models.BooleanField(blank = True, default = True, null = True, verbose_name = "Order Completion")),
                ("order_voucher", models.CharField(default = 1686381177.738877, max_length = 20, null = True, verbose_name = "Order Voucher")),
                ("order_status", models.CharField(blank = True, choices = [("Processed", "Processed"), ("Shipped", "Shipped"), ("Delivered", "Delivered"), ("Failed", "Failed")], default = "Processed", max_length = 20, null = True, verbose_name = "Order Status")),
                ("account", models.ForeignKey(blank = True, null = True, on_delete = django.db.models.deletion.SET_NULL, to = "emporium.account", verbose_name = "Account")),
            ],
            options = {
                "verbose_name": "Purchase",
                "verbose_name_plural": "Purchases",
            },
        ),
        migrations.CreateModel(
            name = "Order",
            fields = [
                ("id", models.BigAutoField(auto_created = True, primary_key = True, serialize = False, verbose_name = "ID")),
                ("purchase_amount", models.IntegerField(blank = True, default = 0, null = True, verbose_name = "Purchase Amount")),
                ("purchase_date", models.DateTimeField(default = datetime.datetime(2023, 6, 10, 15, 12, 57, 738877), verbose_name = "Purchase Date")),
                ("item", models.ForeignKey(blank = True, null = True, on_delete = django.db.models.deletion.SET_NULL, to = "emporium.item", verbose_name = "Item")),
                ("purchase", models.ForeignKey(blank = True, null = True, on_delete = django.db.models.deletion.SET_NULL, to = "emporium.purchase", verbose_name = "Purchase")),
            ],
            options = {
                "verbose_name": "Order",
                "verbose_name_plural": "Orders",
            },
        ),
        migrations.AddIndex(
            model_name = "item",
            index = models.Index(fields = ["item_name"], name = "emporium_it_item_na_a6175a_idx"),
        ),
        migrations.AddField(
            model_name = "delivery",
            name = "account",
            field = models.ForeignKey(blank = True, null = True, on_delete = django.db.models.deletion.SET_NULL, to = "emporium.account", verbose_name = "Account"),
        ),
        migrations.AddField(
            model_name = "delivery",
            name = "purchase",
            field = models.ForeignKey(blank = True, null = True, on_delete = django.db.models.deletion.SET_NULL, to = "emporium.purchase", verbose_name = "Purchase"),
        ),
        migrations.AddField(
            model_name = "account",
            name = "user",
            field = models.OneToOneField(blank = True, null   = True, on_delete = django.db.models.deletion.CASCADE, to = settings.AUTH_USER_MODEL, verbose_name = "User"),
        ),
        migrations.AddField(
            model_name = "user",
            name = "groups",
            field = models.ManyToManyField(blank = True, help_text = "The groups this user belongs to. A user will get all permissions granted to each of their groups.", related_name = "user_set", related_query_name = "user", to = "auth.group", verbose_name = "groups"),
        ),
        migrations.AddField(
            model_name = "user",
            name = "user_permissions",
            field = models.ManyToManyField(blank = True, help_text = "Specific permissions for this user.", related_name = "user_set", related_query_name = "user", to = "auth.permission", verbose_name = "user permissions"),
        ),
        migrations.AddIndex(
            model_name = "delivery",
            index = models.Index(fields = ["phone_number"], name = "emporium_de_phone_n_ca7270_idx"),
        ),
        migrations.AddIndex(
            model_name = "account",
            index = models.Index(fields = ["user_name"], name = "emporium_ac_user_na_96507b_idx"),
        ),
    ]
