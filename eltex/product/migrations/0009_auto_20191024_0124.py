# Generated by Django 2.2.6 on 2019-10-23 19:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0008_auto_20191024_0101'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='watch',
            name='product',
        ),
        migrations.DeleteModel(
            name='Tv',
        ),
        migrations.DeleteModel(
            name='Watch',
        ),
    ]
