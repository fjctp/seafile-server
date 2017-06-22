# Run as daemon
## x86 or x86_64
```docker run -it --rm --name seafile -p 80:80 -p 443:443 -v /mnt/ssl/archive/nas.jsnc.info:/etc/ssl -v /mnt/seafile-db:/var/seafile/shared -e "PROTOCOL=https" -e "DOMAIN=https://nas.jsnc.info" local/seafile bash
docker run -d --name seafile-server \
           -p 80:80 \
           -p 443:443 \
           -e "PROTOCOL=https"
           -e "DOMAIN=https://www.seafile.com"
           -v <YOUR LOCAL STORAGE>:/var/seafile/shared \
           -v <YOUR SSL CERTS>:/etc/ssl \
           fjctp/seafile-server:latest
```
## RPi
```
docker run -d --name seafile-server \
           -p 80:80 \
           -p 443:443 \
           -e "PROTOCOL=https"
           -e "DOMAIN=https://www.seafile.com"
           -v <YOUR LOCAL STORAGE>:/var/seafile/shared \
           -v <YOUR SSL CERTS>:/etc/ssl \
           fjctp/seafile-server:raspberrypi3-latest
```

# Default settings:
+ protocol: https
+ server ip: 0.0.0.0
+ admin email: admin@seafile
+ admin password: password

**PLEASE CHANGE THE PASSWORD UPON LOGIN**

## Change default login or password:
create /var/seafile/shared/admin.txt
``` json
{
  "email": "admin@seafile",
  "password": "password"
}
```

# Pre-build image
See https://hub.docker.com/r/fjctp/seafile-server/
