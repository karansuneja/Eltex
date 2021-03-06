# Generated by Django 3.0.3 on 2020-03-19 08:42

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('accounts', '0007_auto_20191129_0845'),
        ('product', '0015_auto_20200314_0654'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orders',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('price', models.IntegerField()),
                ('orderon', models.DateTimeField(default=datetime.datetime.now)),
                ('delivered', models.BooleanField(default=False)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='product.Product')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='accounts.User')),
            ],
        ),
    ]
