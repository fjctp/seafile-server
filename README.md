# Seafile-server
It deploys seafile server with Nginx, and it supports SSL.

# Configuration
## Environment Variables
| Name | Usage | Default | Example |
| --- | --- | --- | --- |
| PROTOCOL | Protocol wanted | http | https |
| DOMAIN | Server domain name | 0.0.0.0 | https://www.seafile.com |

## Login Information
### Default
| Email | Password |
| --- | --- |
| admin@seafile | password |

**\*\*PLEASE CHANGE THE PASSWORD UPON LOGIN\*\***

### Want to change it?
Create admin.txt in the shared folder with following information
``` json
{
  "email": "admin@seafile",
  "password": "password"
}
```

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

# Pre-build image
See https://hub.docker.com/r/fjctp/seafile-server/
