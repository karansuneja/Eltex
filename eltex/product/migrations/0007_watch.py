# Generated by Django 2.2.6 on 2019-10-23 19:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0006_laptop_tv'),
    ]

    operations = [
        migrations.CreateModel(
            name='Watch',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
                ('brand', models.CharField(max_length=200)),
                ('dial_shape', models.CharField(max_length=200)),
                ('water_resistance', models.BooleanField(default=False)),
                ('strap_material', models.CharField(max_length=200)),
                ('dimensions', models.CharField(max_length=200)),
                ('charge_time', models.CharField(max_length=200)),
                ('battery_life', models.CharField(max_length=200)),
                ('call_function', models.CharField(max_length=200)),
                ('wifi', models.BooleanField(default=False)),
                ('gps', models.BooleanField(default=False)),
                ('sensor', models.CharField(max_length=200)),
                ('price', models.IntegerField(max_length=200)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='product.Product')),
            ],
        ),
    ]
