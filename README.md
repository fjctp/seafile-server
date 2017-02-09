# docker-armhf-seafile-server
Seafile server for raspberry pi

# How to start
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

PLEASE CHANGE THE PASSWORD UPON LOGIN

If you want to change the default login or password, create a file named "auth.txt" with the following information, and put it inside the folder you attach to /var/seafile/shared.
## Example:
``` json
{
  email: admin@seafile
  password: password
}
```

# Pre-build image
See https://hub.docker.com/r/fjctp/armhf-seafile-server/
