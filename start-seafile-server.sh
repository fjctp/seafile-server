#!/bin/bash

set -e

docker run -it --name seafile-server \
       -p 8082:8082 \
       -p 9000:9000 \
       -v /mnt/syba/seafile-db:/var/seafile/shared \
       fjctp/armhf-seafile-server:6.0.7 \
       /bin/bash
