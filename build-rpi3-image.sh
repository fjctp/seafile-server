#!/bin/bash

set -xe

cp Dockerfile Dockerfile.armv7
sed -i "s|FROM .*|FROM resin/rpi-raspbian:jessie|g" Dockerfile.armv7
sed -i 's|ENV SEAFILE_SERVER_URL.*|ENV SEAFILE_SERVER_URL https://github.com/haiwen/seafile-rpi/releases/download/v${SEAFILE_SERVER_VERSION}/seafile-server_${SEAFILE_SERVER_VERSION}_stable_pi.tar.gz|g' Dockerfile.armv7
#docker build . -f Dockerfile.armv7 -t fjctp/seafile-server:raspberrypi3-latest
