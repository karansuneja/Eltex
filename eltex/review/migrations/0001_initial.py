# Generated by Django 3.0.3 on 2020-03-24 08:28

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('product', '0015_auto_20200314_0654'),
    ]

    operations = [
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=250)),
                ('rating', models.IntegerField()),
                ('message', models.CharField(max_length=250)),
                ('date', models.DateTimeField(default=datetime.datetime.now)),
                ('product_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='product.Product')),
            ],
        ),
    ]