# Generated by Django 2.2.6 on 2019-12-26 09:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('product', '0010_tv_watch'),
    ]

    operations = [
        migrations.CreateModel(
            name='Compare',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=250)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='comp_prod', to='product.Product')),
            ],
        ),
    ]
