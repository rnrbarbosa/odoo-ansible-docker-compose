
## Copy Postgres Dump file into DB container
```
$ sudo docker cp <pgdump_file> db:/mnt/backup/
```

## Copy the custom ADDONS into the Odoo container
```
$ sudo docker cp /path/addons/. odoo:/mnt/extra-addons/
```

## Copy the Filestore into the Odoo container

```
$ sudo docker exec -u root -it odoo mkdir /var/lib/odoo/filestore

$ sudo docker exec -u root -it odoo chmod -R 777 /var/lib/odoo/filestore

$ sudo docker cp /path/to/filestore/arme_prod odoo:/var/lib/odoo/filestore```

## Stop Odoo container
```
$ sudo docker stop odoo
```

## Restore Database
```
$ sudo docker exec -u postgres db psql -U arme arme_prod -f /mnt/backup/arme.pgdump
```

## Start Odoo Container
```
$ sudo docker restart odoo
```