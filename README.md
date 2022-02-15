[![build](https://github.com/fab-infra/docker-opendkim/actions/workflows/build.yml/badge.svg)](https://github.com/fab-infra/docker-opendkim/actions/workflows/build.yml)

# OpenDKIM Docker image

## Ports

The following ports are exposed by this container image.

| Port | Description |
| ---- | ----------- |
| 8891 | TCP port |

## Environment variables

The following environment variables can be used with this container.

| Variable | Description | Default value |
| -------- | ----------- | ------------- |
| DKIM_DOMAIN | Domain name | localdomain |
| DKIM_KEYFILE | Private key file location | /var/lib/opendkim/private.key |
| DKIM_SELECTOR | DKIM selector | default |
| DKIM_INTERNALHOSTS | Allowed internal subnets (comma-separated)| 127.0.0.1 |

## Volumes

The following container paths can be used to mount a dedicated volume or to customize configuration.

| Path | Description |
| ---- | ----------- |
| /var/lib/opendkim/private.key | PEM-encoded private key file |

## Useful links

- [OpenDKIM documentation](http://www.opendkim.org/docs.html)
