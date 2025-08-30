# Avahi Docker Image

## About

Forked from: https://gitlab.com/ydkn/docker-avahi

Docker: https://hub.docker.com/repository/docker/michaelbalser/avahi

Docker images available for:
- amd64
- arm64v8
- arm32v6
- arm32v7

## Configuration

Put your service definition files in a directory and mount it as a volume to _/etc/avahi/services_.

### Options

Configuration is done through environment variables.

- **ALLOW_INTERFACES** set _allow-interfaces_ in avahi-daemon.conf
- **DENY_INTERFACES** set _deny-interfaces_ in avahi-daemon.conf

## Start the container

```bash
docker run -d 
  --name avahi \
  --restart always \
  --net=host \
  -e ALLOW_INTERFACES=eth0 \
  -v /etc/avahi/services:/etc/avahi/services \
  michaelbalser/avahi:latest
```
