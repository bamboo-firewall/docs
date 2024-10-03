# Bamboo Firewall CLI

```shell
BAMBOO Firewall CLI
Description:
  The bbfwcli is used to manage global policy,
  to view and manage host endpoint, global network set configuration.

Usage:
  bbfwcli [command]

Available Commands:
  completion  Generate bash completion script for shell(bash, zsh)
  create      Create resources by filename
  delete      Delete resources by name or filename
  get         Get resource by name
  help        Help about any command
  version     Print the version information

Flags:
  -h, --help   help for bbfwcli

Use "bbfwcli [command] --help" for more information about a command.
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
  bbfwcli create [resourceType] [flags]

Examples:
  # Create a global network policy
  bbfwcli create gnp policy.yaml

  # Create many global network policy
  bbfwcli create gnp policy1.yaml policy2.yaml

Flags:
  -f, --file stringArray   file to read
  -h, --help               help for create
```

## Get resource
```shell
Get resource by name

Usage:
  bbfwcli get [flags]

Examples:
  # Get a global network policy by name
  bbfwcli get gnp allow_ssh

  # Get a global network policy by name with json output format
  bbfwcli get gnp allow_ssh -o json


Flags:
  -h, --help            help for get
  -o, --output string   output format(yaml|json). Default: yaml
```

## Delete resource

```shell
The delete command is used to delete resources by name or filename.

  Resource type available:
    * HostEndpoint(or hep)
    * GlobalNetworkSet(or gns)
    * GlobalNetworkPolicy(or gnp)

Usage:
  bbfwcli delete [resourceType] [flags]

Examples:
  # Delete a policy with name
  bbfwcli delete gnp allow_ssh

  # Delete many policy with name
  bbfwcli delete hep allow_ssh allow_ping

  # Delete many policy with filename
  bbfwcli delete hep allow_ssh.yaml allow_ping.yaml

Flags:
  -f, --file stringArray   file to read
  -h, --help               help for delete
```

## Auto completion command
```shell
Generate bash completion script for shell(bash, zsh)

Usage:
  bbfwcli completion

Examples:
  # Gen completion for bash shell
  bbfwcli completion bash

  # Gen completion for zsh shell
  bbfwcli completion zsh

Flags:
  -h, --help   help for completion
```

## Version
```shell
Print the version information

Usage:
  bbfwcli version [flags]

Flags:
  -h, --help   help for version
```

| Field        | Value            |
|--------------|------------------|
| Version      | Version of cli   |
| Branch       | Branch build cli |
| Build        | DateTime build   |
| Organization | Owner            |
