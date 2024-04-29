#!/bin/bash

# go to root directory
#cd ../

# build the docker image
docker build . -t dev-portal

# save the built image to a tar in the root directory
docker save dev-portal > dev-portal.tar