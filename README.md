# dockerized email services


## setup
```
./adduser username
```


## building
This depends on you having appropriate MX DNS records and a Sendgrid API key.
```
docker build -t email . --build-arg domain=example.com --build-arg sendgrid=sendgrid_api_key
```


## deploying
This depends on having cert.pem and privkey.pem in /etc/ssl/private/certs.
These can be generated by letsencrypt's certbot using ```certbot certonly --standalone``` and copied over.
```
docker run -d --restart always -p 25:25 -p 587:587 -p 995:995 -v /etc/ssl/private/certs:/certs:ro email
```


## sensitive data
You may notice that the build command embeds both your domain name and your Sendgrid API key into the image created.
DO NOT SHARE THIS IMAGE. This is meant to be built and run on a single host running a single instance of docker.

If you want to handle sensitive information in a Docker swarm, look into the secrets branch of this repo.
It takes a little more work, but sensitive data is handled more correctly. It's also a little more refined.
