# Generated by Django 3.0.2 on 2020-02-02 12:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0010_tv_watch'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='photo_3',
            field=models.ImageField(blank=True, upload_to='photos/%y/%m/%d'),
        ),
    ]
