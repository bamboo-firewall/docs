# Bamboo Firewall CLI

```shell
BAMBOO Firewall CLI
Description:
  The bbfw is used to manage global policy,
  to view and manage host endpoint, global network set configuration.

Usage:
  bbfw [command]

Available Commands:
  completion  Generate bash completion script for shell(bash, zsh)
  create      Create resources by filename
  delete      Delete resources
  get         Get resource by name
  help        Help about any command
  list        List resource
  version     Print the version information

Flags:
  -h, --help   help for bbfw

Use "bbfw [command] --help" for more information about a command.

```

## Prepare
- set env for apiserver address
```shell
export BAMBOOFW_APISERVER_ADDRESS="address of APIServer" 
```

## Input file format
- [input](./usecase.md#cli)

## Create resource

```shell
The create command is used to create resources by filename.

  Resource type available:
    * HostEndpoint(or hep)
    * GlobalNetworkSet(or gns)
    * GlobalNetworkPolicy(or gnp)

Usage:
  bbfw create [resourceType] [flags]

Examples:
  # Create a global network policy
  bbfw create gnp -f policy.yaml

  # Create many global network policy
  bbfw create gnp -f policy1.yaml -f policy2.yaml

Flags:
  -f, --file stringArray   file to read
  -h, --help               help for create
```

## List resource
```shell
List resource

Usage:
  bbfw list [flags]

Examples:
  # List global network sets
  bbfw list gns

  # List global network policy
  bbfw list gnp

  # List global network policy with order
  bbfw list gnp --isOrder

  # List host endpoint
  bbfw list hep

  # List host endpoint with tenantID
  bbfw list hep --tenantID=1

  # List host endpoint with IP
  bbfw list hep --ip=192.168.0.1

  # List host endpoint with tenantID and IP
  bbfw list hep --tenantID=1 --ip=192.168.0.1,


Flags:
  -h, --help            help for list
      --ip string       Host Endpoint: filter by IP
      --isOrder         Global Network Policy: filter by Order
      --tenantID uint   Host Endpoint: filter by TenantID
```

## Get resource
```shell
Get resource

Usage:
  bbfw get [flags]

Examples:
  # Get a global network policy by name
  bbfw get gnp allow_ssh

  # Get a global network policy by name with json output format
  bbfw get gnp allow_ssh -o json

 # Get a host endpoint
  bbfw get hep --tenantID=1 --ip=192.168.123.0

  # Get a global network set by name
  bbfw get gns allow_ssh

  # Get a global network set by name with json output format
  bbfw get gns my_set -o json


Flags:
  -h, --help            help for get
      --ip string       HEP: get by ip
  -o, --output string   output format(yaml|json). Default: yaml
      --tenantID uint   HEP: get by tenantID
```

## Delete resource

```shell
The delete command is used to delete resources by name(Global Network Policy, Global Network Set),
by tenantID,IP(Host Endpoint) or filename. 

  Resource type available:
    * HostEndpoint(or hep)
    * GlobalNetworkSet(or gns)
    * GlobalNetworkPolicy(or gnp)

Usage:
  bbfw delete [resourceType] [flags]

Examples:
  # Delete a policy with name
  bbfw delete gnp allow_ssh

  # Delete many policy with name
  bbfw delete gnp allow_ssh allow_ping

  # Delete many policy with filename
  bbfw delete gnp -f allow_ssh.yaml -f allow_ping.yaml

  # Delete a set with name
  bbfw delete gns server

  # Delete many sets with name
  bbfw delete gns server vm

  # Delete many sets with filename
  bbfw delete gns -f server.yaml -f vm.yaml

  # Delete a hep with tenantID and ip
  bbfw delete hep --tenantID=1 --ip=192.168.1.1

  # Delete many heps with filename
  bbfw delete hep -f server.yaml -f vm.yaml


Flags:
  -f, --file stringArray   file to read
  -h, --help               help for delete
      --ip string          HEP: get by ip
      --tenantID uint      HEP: get by tenantID
```

## Auto completion command
```shell
Generate a completion script for bash or zsh shell

Usage:
  bbfw completion

Examples:
  # Gen completion for bash shell
  bbfw completion bash

  # Gen completion for zsh shell
  bbfw completion zsh

Flags:
  -h, --help   help for completion
```

## Version
```shell
Print the version information

Usage:
  bbfw version [flags]

Flags:
  -h, --help   help for version
```

| Field        | Value            |
|--------------|------------------|
| Version      | Version of cli   |
| Branch       | Branch build cli |
| Build        | DateTime build   |
| Organization | Owner            |
