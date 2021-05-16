#! /bin/bash

docker cp /app/odoo/addons/. odoo:/mnt/extra-addons/
docker cp /app/odoo/data/filestore/arme_prod/. odoo:/var/lib/odoo/filestore/arme_prod/
docker cp /var/tmp/arme.pgdump postgres:/mnt/backup/
#docker exec -u root -it odoo chown -R odoo:odoo /var/lib/odoo/filestore
#docker exec -u root -it odoo chown -R odoo:odoo /mnt/extra-addons
#docker exec -u root -it odoo chmod 777 -R /var/lib/odoo
#docker exec -u root -it odoo chmod 777 -R /mnt/extra-addons
docker stop odoo
docker exec -u postgres -it postgres -O arme createdb arme_prod
docker exec -u postgres -it postgres psql -U arme arme_prod -f /mnt/backup/arme.pgdump
docker start odoo
