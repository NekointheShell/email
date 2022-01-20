# dockerized email services


## setup
```
./adduser username
```


## building
```
docker build -t email . --build-arg domain=example.com
```


## deploying
```
docker run -d -p 25:25 -p 587:587 -p 995:995 -v /etc/ssl/private/certs:/certs:ro email
```
