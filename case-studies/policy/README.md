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
# 1. Download api-server source code
https://github.com/bamboo-firewall/be/tree/v2

# 2. After download, run command
cd be/docker
docker compose up -d
```

### Using binary file
```shell
# 1. Download bamboo-apiserver binary file with your specific distribution in bin folder

# 2. Setup environment or .evn file
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

# 3. Run binary file(if has .env file run with --config-file=.env)
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
sudo apt-get install ipset
```

### Run binary file
```shell
# 1. Download bamboo-agent binary file with your specific distribution in bin folder

# 2. Setup environment or .env file
# api-server address
API_SERVER_ADDRESS="address of api-server"
# ip address of api-server
API_SERVER_IPV4="ipv4 of api-server"
# The organization to which it belongs
TENANT_ID=1
# ip address of host
HOST_IPV4="ipv4 of host"
# enable ipv6
IPV6_SUPPORT=false
# lock timeout when using iptables
IPTABLES_LOCK_SECONDS_TIMEOUT=3
# time interval to refresh rule from api-server
DATASTORE_REFRESH_INTERVAL="5s"
# time interval to refresh rule from dataplane(linux)
DATAPLANE_REFRESH_INTERVAL="5s"
# enable debug
DEBUG=true

# 3. Run binary file(if has .env file run with --config-file=.env)
```
