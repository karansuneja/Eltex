# Generated by Django 2.2.6 on 2019-10-09 19:34

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Seller',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
                ('photo', models.ImageField(upload_to='seller/%y/%m/%d')),
                ('phone', models.CharField(max_length=10)),
                ('email', models.EmailField(max_length=50)),
                ('address', models.TextField()),
                ('joindate', models.DateTimeField(blank=True, default=datetime.datetime.now)),
                ('seller_of_the_month', models.BooleanField(default=False)),
            ],
        ),
    ]
