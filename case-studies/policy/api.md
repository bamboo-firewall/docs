# BAMBOO Firewall API Server

API for gathering bamboo firewall information:

* Host End Point
  * represents one or more real or virtual interfaces attached to a host that is running bamboo-policy
* Global Network Set
  * represents an arbitrary set of IP subnetworks/CIDRs, allowing it to be matched by rule in Global network Policy
* Global Network Policy (Policy)
  * represents an ordered set of rules which are applied to a collection of endpoint

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
    "tenantID": 0,
    "ip": "",
    "ips": [
      ""
    ]
  },
  "description": ""
}'
```

#### List
```curl
curl --location 'http://localhost:8080/api/v1/hostEndpoints?tenantID=&ip='
```

#### Get
```curl
curl --location 'http://localhost:8080/api/v1/hostEndpoints/byTenantID/:tenantID/byIP/:ip'
```

#### Delete
```curl
curl --location --request DELETE 'http://localhost:8080/api/v1/hostEndpoints' \
--header 'Content-Type: application/json' \
--data '{
  "spec": {
    "tenantID": 0,
    "ip": "",
    "ips: [""],
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

#### List
```curl
curl --location 'http://localhost:8080/api/v1/globalNetworkSets'
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
    "order": 1,
    "ingress": [
      {
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
    ],
    "egress": [
      {
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
    ]
  }
}'
```

#### List
```curl
curl --location 'http://localhost:8080/api/v1/globalNetworkPolicies?isOrder=true'
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
