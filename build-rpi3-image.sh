#!/bin/bash

set -xe

if [ ! -z $1 ]; then
  TAG=$1
else
  TAG=fjctp/seafile-server:raspberrypi3-latest
fi

echo "Using tag name: $TAG"

cp Dockerfile Dockerfile.armv7
sed -i "s|FROM .*|FROM resin/rpi-raspbian:jessie|g" Dockerfile.armv7
sed -i 's|ENV SEAFILE_SERVER_URL.*|ENV SEAFILE_SERVER_URL https://github.com/haiwen/seafile-rpi/releases/download/v${SEAFILE_SERVER_VERSION}/seafile-server_${SEAFILE_SERVER_VERSION}_stable_pi.tar.gz|g' Dockerfile.armv7
docker build . -f Dockerfile.armv7 -t $TAG
