# Generated by Django 3.0.3 on 2020-03-14 06:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0013_auto_20200205_1433'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='brand',
            field=models.CharField(default='mi', max_length=200),
        ),
    ]