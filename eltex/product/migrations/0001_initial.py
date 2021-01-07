# Generated by Django 2.2.6 on 2019-10-11 17:52

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('seller', '0005_seller'),
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
                ('title', models.CharField(max_length=100)),
                ('price', models.IntegerField()),
                ('rating', models.IntegerField(blank=True)),
                ('category', models.CharField(max_length=50)),
                ('photo', models.ImageField(upload_to='photos/%y/%m/%d')),
                ('photo_1', models.ImageField(upload_to='photos/%y/%m/%d')),
                ('photo_2', models.ImageField(upload_to='photos/%y/%m/%d')),
                ('photo_3', models.ImageField(upload_to='photos/%y/%m/%d')),
                ('photo_4', models.ImageField(blank=True, upload_to='photos/%y/%m/%d')),
                ('photo_5', models.ImageField(blank=True, upload_to='photos/%y/%m/%d')),
                ('photo_6', models.ImageField(blank=True, upload_to='photos/%y/%m/%d')),
                ('stock', models.IntegerField()),
                ('launch_date', models.DateTimeField(default=datetime.datetime.now)),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='seller.Seller')),
            ],
        ),
    ]