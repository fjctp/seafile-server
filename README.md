# Run as daemon
```
docker run -d --name seafile-server \
           -p 8082:8082 \
           -p 9000:9000 \
           -v <YOUR LOCAL STORAGE>:/var/seafile/shared \
           fjctp/armhf-seafile-server
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
