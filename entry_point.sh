#!/bin/bash

set -e 

SERVER_NAME=seafile
SERVER_IP=0.0.0.0
SEAFILE_PORT=8082
SEAHUB_PORT=9000

function start_server() {
  echo "Starting server"
  $BINDIR/seafile.sh start
  $BINDIR/seahub.sh start $SEAHUB_PORT
}

##### main
if [ -d /var/seafile/shared/ccnet ]; then
  start_server
else
  echo "Setting up server"
  $BINDIR/setup-seafile.sh auto -n $SERVER_NAME -i $SERVER_IP -p $SEAFILE_PORT -d $TOPDIR/shared
  start_server
fi

# a hack to keep the script running
while true; do sleep 1000; done
