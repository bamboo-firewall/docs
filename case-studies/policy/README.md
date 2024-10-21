# Bamboo Firewall Policy

Trinh Dinh Bien
Head of Infra department
bienkma@ghtk.co
https://bienkma.github.io

- [Architecture](./architecture.md)
- [API](./api.md)
- [CLI](./cli.md)

# How to install

## Required
- api-server
  - docker
- agent:
  - supported distribution: ubuntu18.04, ubuntu22.04, ubuntu24.04

## API-Server

- Using docker or binary file

### Using docker

#### Install docker
https://docs.docker.com/engine/install/

#### After install run command
```shell
# 1. Download files in docker folder

# 2. After download, run command
docker compose up -d
```

### Using binary file
```shell
# 1. Download bamboo-apiserver binary file with your specific distribution in bin folder

# 2. Setup env
# host of api-server
HTTP_SERVER_HOST=0.0.0.0
# port of api-server
HTTP_SERVER_PORT=8080
# maximum duration for reading the entire request
HTTP_SERVER_READ_TIMEOUT=5s
# is the amount of time allowed to read request headers.
HTTP_SERVER_READ_HEADER_TIMEOUT=5s
# is the maximum duration before timing out writes of the response.
HTTP_SERVER_WRITE_TIMEOUT=5s
# is the maximum amount of time to wait for the next request when keep-alives are enabled.
HTTP_SERVER_IDLE_TIMEOUT=2m
# uri connect to mongdb
DB_URI=""
# logging
LOGGING=false

# 3. Run binary file
```

### Create resource
- using [API](./api.md)
- or [CLI](./cli.md)(Download bbfw binary file with your specific distribution in bin folder)

## Agent

- 2 steps
  - install iptables and ipset
  - run binary file

### Install iptables and ipset

```shell
sudo apt-get update
sudo apt-get install iptables
sudo apy-get install ipset
```

### Run binary file
```shell
# 1. Download bamboo-agent binary file with your specific distribution in bin folder

# 2. Setup env
# api-server address
API_SERVER_ADDRESS="http://localhost:8080"
# ip address of api-server
API_SERVER_IPV4="127.0.0.1"
# lock timeout when using iptables
IPTABLES_LOCK_SECONDS_TIMEOUT=3
# name of host endpoint
HOST_NAME="my_host"
# time interval to refresh rule from api-server
DATASTORE_REFRESH_INTERVAL="5s"
# time interval to refresh rule from dataplane(linux)
DATAPLANE_REFRESH_INTERVAL="5s"

# 3. Run binary file
```
