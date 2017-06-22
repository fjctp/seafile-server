FROM ubuntu:16.04
MAINTAINER snchan20@yahoo.com

ENV SEAFILE_SERVER_VERSION 6.0.9
ENV SEAFILE_SERVER_URL https://bintray.com/artifact/download/seafile-org/seafile/seafile-server_${SEAFILE_SERVER_VERSION}_x86-64.tar.gz

ENV TOPDIR /var/seafile
ENV BINDIR $TOPDIR/seafile-server-${SEAFILE_SERVER_VERSION}
ENV SHAREDDIR $TOPDIR/shared

RUN apt-get update \
    && apt-get install -y \
        python2.7 \
        libpython2.7 \
        python-setuptools \
        python-imaging \
        python-ldap \
        python-urllib3 \
        sqlite3 \
        wget \
        nano \
        nginx \
    && apt-get autoremove \
    && apt-get clean \
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/* 
RUN mkdir -p $TOPDIR \
    && cd $TOPDIR \
    && wget ${SEAFILE_SERVER_URL} \
    && tar -xzf seafile-server_* \
    && mkdir installed \
    && mv seafile-server_* installed \
    && ln -s $TOPDIR/seafile-server-6.0.9 $TOPDIR/seafile-server-latest \
    && rm /etc/nginx/sites-enabled/default \
    && ln -s /etc/nginx/sites-available/seafile.conf /etc/nginx/sites-enabled/seafile.conf
    
COPY seafile/ $BINDIR/
COPY nginx/ /etc/nginx/sites-available/
COPY entry_point.sh $TOPDIR

EXPOSE 80 443
VOLUME ["/var/seafile/shared"]

WORKDIR $BINDIR
#ENTRYPOINT ["/var/seafile/entry_point.sh"]
