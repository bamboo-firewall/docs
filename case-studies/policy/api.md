# BAMBOO Firewall API Server

API for gathering bamboo firewall information:

* Host End Point
* Global Network Set
* Global Network Policy (Policy)

## Input format
- [input](./usecase.md#api)

## Public API
### Health check
```curl
curl --location 'http://localhost:8080/api/v1/ping'
```

## Protect API
### Host Endpoint
#### Create
```curl
curl --location 'http://localhost:8080/api/v1/hostEndpoints' \
--header 'Content-Type: application/json' \
--data '{
  "metadata": {
    "name": "",
    "labels": {}
  },
  "spec": {
    "interfaceName": "",
    "ips": [
      ""
    ]
  },
  "description": ""
}'
```

#### Get
```curl
curl --location 'http://localhost:8080/api/v1/hostEndpoints/byName/:hostName'
```

#### Delete
```curl
curl --location --request DELETE 'http://localhost:8080/api/v1/hostEndpoints' \
--header 'Content-Type: application/json' \
--data '{
  "metadata": {
    "name": ""
  },
}'
```

### Global network set
#### Create
```curl
curl --location 'http://localhost:8080/api/v1/globalNetworkSets' \
--header 'Content-Type: application/json' \
--data '{
  "metadata": {
    "name": "",
    "labels": {}
  },
  "spec": {
    "nets": [
      ""
    ]
  },
  "description": ""
}'
```

#### Get
```curl
curl --location 'http://localhost:8080/api/v1/globalNetworkSets/byName/:myset'
```

#### Delete
```curl
curl --location --request DELETE 'http://localhost:8080/api/v1/globalNetworkSets' \
--header 'Content-Type: application/json' \
--data '{
  "metadata": {
    "name": ""
  },
}'
```

### Global network policy
#### Create
```curl
curl --location 'http://localhost:8080/api/v1/globalNetworkPolicies' \
--header 'Content-Type: application/json' \
--data '{
  "metadata": {
    "name": "",
    "labels": {}
  },
  "description": "",
  "spec": {
    "selector": "",
    "ingress": {
      "metadata": {},
      "action": "",
      "protocol": "",
      "notProtocol": "",
      "ipVersion": 0,
      "source": {
        "selector": "",
        "nets": [""],
        "notNets": [""],
        "ports": [],
        "notPorts": []
      },
      "destination": {
        "selector": "",
        "nets": [""],
        "notNets": [""],
        "ports": [],
        "notPorts": []
      }
    },
    "egress": {
      "metadata": {},
      "action": "",
      "protocol": "",
      "notProtocol": "",
      "ipVersion": 0,
      "source": {
        "selector": "",
        "nets": [""],
        "notNets": [""],
        "ports": [],
        "notPorts": []
      },
      "destination": {
        "selector": "",
        "nets": [""],
        "notNets": [""],
        "ports": [],
        "notPorts": []
      }
    }
  }
}'
```

#### Get
```curl
curl --location 'http://localhost:8080/api/v1/globalNetworkPolicies/byName/:policyName'
```

#### Delete
```curl
curl --location --request DELETE 'http://localhost:8080/api/v1/globalNetworkPolicies' \
--header 'Content-Type: application/json' \
--data '{
  "metadata": {
    "name": ""
  },
}'
```