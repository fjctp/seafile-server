FROM resin/rpi-raspbian:jessie
MAINTAINER snchan20@yahoo.com

ENV SEAFILE_SERVER_VERSION 6.0.7

RUN apt-get update && \
    apt-get install python2.7 libpython2.7 python-setuptools python-imaging python-ldap python-urllib3 sqlite3 wget nano && \
    apt-get autoremove && apt-get clean && \
    rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*    
RUN mkdir -p /var/seafile && cd /var/seafile && \
    wget https://github.com/haiwen/seafile-rpi/releases/download/v${SEAFILE_SERVER_VERSION}/seafile-server_${SEAFILE_SERVER_VERSION}_stable_pi.tar.gz && \
    tar -xzf seafile-server_* && \
    mkdir installed && \
    mv seafile-server_* installed 
    
ADD conf-scripts/* /var/seafile/seafile-server-${SEAFILE_SERVER_VERSION}/
ADD conf-scripts/seahub/seahub/* /var/seafile/seafile-server-${SEAFILE_SERVER_VERSION}/seahub/seahub/

WORKDIR /var/seafile/seafile-server-${SEAFILE_SERVER_VERSION}
CMD [/bin/bash]