# Flow Apply rules

## Agent --> API-Server

### Apply rule from User

```mermaid
sequenceDiagram
    autonumber
    actor U as User
    participant APIS as API Server
    participant DB as Database
    U ->> APIS: Apply rules
    APIS ->> APIS: Gen uuid
    APIS ->> DB: Save rules and uuid to database
    APIS ->> U: Response
```

### Call interval from Agent to API-Server

```mermaid
sequenceDiagram
    autonumber
    participant APIS as API Server
    participant DB as Database
    participant Agent as Agent
    participant DP as DataPlane
    Agent ->> APIS: Interval check rules change by uuid of agent_id
    APIS ->> DB: Get by uuid of agent
    APIS ->> APIS: If get by uuid not found. Get all rules of agent_id
    APIS ->> Agent: Response all rules if uuid not match
    Agent ->> Agent: Save rule and uuid to mem cache
    Agent ->> DP: Get rules
    Agent ->> Agent: Hash current rules from APIS and rules of DataPlane
    Agent ->> Agent: Check rule is create, change or delete
    Agent ->> DP: Apply rules if rule is create, change or delete
```

### Interval check change rule from DataPlane in Agent

```mermaid
sequenceDiagram
    autonumber
    participant Agent as Agent
    participant DP as DataPlane
    Agent ->> DP: Interval get rules
    Agent ->> Agent: Hash current rules from APIS and rules of DataPlane
    Agent ->> Agent: Check rule is change or delete
    Agent ->> DP: Apply rules if rule is change or delete
```

## API-Server <---> Agent

### Flow apply rule from API server

```mermaid
sequenceDiagram
    autonumber
    actor U as User
    participant APIS as API Server
    participant DB as Database
    participant Agent as Agent
    participant DP as DataPlane
    U ->> APIS: apply rules
    APIS ->> DB: save rules to database
    APIS ->> Agent: Apply rules to Agent
    Agent ->> Agent: Save rule and gen hash rule to mem cache
    Agent ->> APIS: response
    APIS ->> U: response
    Agent ->> Agent: check rule is append, replace or delete
    Agent ->> DP: apply rule
```

### Interval check change rule from DataPlane in Agent

```mermaid
sequenceDiagram
    autonumber
    participant Agent as Agent
    participant DP as DataPlane
    Agent ->> DP: Interval get rules
    Agent ->> Agent: Hash current rules from APIS and rules of DataPlane
    Agent ->> Agent: Check rule is change or delete
    Agent ->> DP: Apply rules if rule is change or delete
```

## APIS <---> Agent(keep connection)

### Flow apply rule from API server

```mermaid
sequenceDiagram
    autonumber
    actor U as User
    participant APIS as API Server
    participant DB as Database
    participant Agent as Agent
    participant DP as DataPlane
    U ->> APIS: apply rules
    APIS ->> DB: save rules to database
    APIS ->> Agent: Send event to agent
    Agent ->> Agent: Save rule and gen hash rule to mem cache
    Agent ->> APIS: response
    APIS ->> U: response
    Agent ->> Agent: check rule is append, replace or delete
    Agent ->> DP: apply rule
```

### Interval check change rule from DataPlane in Agent

```mermaid
sequenceDiagram
    autonumber
    participant Agent as Agent
    participant DP as DataPlane
    Agent ->> DP: Interval get rules
    Agent ->> Agent: Hash current rules from APIS and rules of DataPlane
    Agent ->> Agent: Check rule is change or delete
    Agent ->> DP: Apply rules if rule is change or delete
```

## hash rule
```
sha224(rule) -> hash
```

## DataPlane
### ipset
### iptables
### nftables
### ebpf
