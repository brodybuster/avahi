# Avahi Docker Image

## Configuration

Put your service definition files in a directory and mount it as a volume to _/etc/avahi/services_.

### Options

Configuration is done through environment variables.

- **ALLOW_INTERFACES** set _allow-interfaces_ in avahi-daemon.conf
- **DENY_INTERFACES** set _deny-interfaces_ in avahi-daemon.conf

## Start the container

```bash
docker run -d --restart always \
  --net=host \
  -e ALLOW_INTERFACES=eth0 \
  -v $(pwd)/services:/etc/avahi/services \
  ydkn/avahi:latest
```
## Publishing on GitHub

This repository includes a GitHub Actions workflow that publishes the image to GitHub Container Registry.

- Push to `main` to publish/update `ghcr.io/brodybuster/avahi:main`
- Push a tag like `v1.0.0` to publish `ghcr.io/brodybuster/avahi:v1.0.0`
- The default branch also publishes `ghcr.io/brodybuster/avahi:latest`

GitHub Actions uses the repository `GITHUB_TOKEN`, so the workflow only needs repository Actions to be enabled. The workflow requests `packages: write` so it can push to GHCR.