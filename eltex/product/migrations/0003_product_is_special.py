# Generated by Django 2.2.6 on 2019-10-11 20:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0002_mobile'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='is_special',
            field=models.BooleanField(default=False),
        ),
    ]
