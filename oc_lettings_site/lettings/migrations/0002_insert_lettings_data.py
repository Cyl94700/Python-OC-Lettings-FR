# Generated by Django 3.0 on 2023-03-01 08:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lettings', '0001_initial'),
    ]

    operations = [
        migrations.RunSQL("""
                INSERT INTO main.lettings_address
                SELECT * FROM main.oc_lettings_site_address;
                INSERT INTO main.lettings_letting
                SELECT * FROM main.oc_lettings_site_letting;
            """)
    ]
