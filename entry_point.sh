#!/bin/bash

set -e 

SERVER_NAME=seafile
if [ -z $DOMAIN ]; then 
    SERVER_IP=0.0.0.0
    DOMAIN=http://$SERVER_IP
else
    SERVER_IP=$DOMAIN
fi
SEAFILE_PORT=8082
SEAHUB_PORT=8000

function seafile_server() {
  echo "$1 server"
  $BINDIR/seafile.sh $1
  $BINDIR/seahub.sh $1-fastcgi $SEAHUB_PORT
}

function update_link() {
    WEB_URL=$1
    SEAHUB_SETTING_PY=$SHAREDDIR/conf/seahub_settings.py
    CCNET_CONF=$SHAREDDIR/conf/ccnet.conf
    
    if [ -z $(grep "FILE_SERVER_ROOT" $SEAHUB_SETTING_PY) ]; then
        echo "FILE_SERVER_ROOT = '$WEB_URL/seafhttp'" >> $SEAHUB_SETTING_PY
    else
        sed -i "s:FILE_SERVER_ROOT.*:FILE_SERVER_ROOT = '$WEB_URL/seafhttp':g" $SEAHUB_SETTING_PY
    fi
    sed -i "s:SERVICE_URL.*:SERVICE_URL = $URL:g" $CCNET_CONF
}

##### main
if [ ! -d $TOPDIR/shared/ccnet ]; then
  echo "Setting up server"
  $BINDIR/setup-seafile.sh auto -n $SERVER_NAME -i $SERVER_IP -p $SEAFILE_PORT -d $TOPDIR/shared
  update_link $DOMAIN
fi

seafile_server start
/usr/sbin/nginx

# a hack to keep the script running
while true; do sleep 1000; done
