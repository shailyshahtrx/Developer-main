#!/bin/bash
# This script will be on the machine where the portal is running

# navigate to where the image tar should be
cd /var/tmp/

# load the image into docker so that it can be used to create containers
docker load --input dev-portal.tar

# navigate back to dev-portal directory
cd /opt/dev-portal/

# recreate the dev-portal service using the updated image
docker compose up -d --force-recreate

# prune images not in use
docker image prune -af

# clean up image file
rm /var/tmp/dev-portal.tar