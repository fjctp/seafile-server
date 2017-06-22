# Run as daemon
## x86 or x86_64
```
docker run -d --name seafile-server \
           -p 80:80 \
           -e "DOMAIN=www.seafile.com"
           -v <YOUR LOCAL STORAGE>:/var/seafile/shared \
           fjctp/seafile-server:latest
```
## RPi
```
docker run -d --name seafile-server \
           -p 80:80 \
           -e "DOMAIN=www.seafile.com"
           -v <YOUR LOCAL STORAGE>:/var/seafile/shared \
           fjctp/seafile-server:raspberrypi3-latest
```

# Default settings:
+ email: admin@seafile
+ password: password

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
