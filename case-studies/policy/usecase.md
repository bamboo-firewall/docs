# Agent --> API-Server

### Flow apply rule from API server

``````mermaid
sequenceDiagram
autonumber
actor U as User
participant APIS as API Server
participant Agent as Agent
participant DB as Database
U ->> APIS: apply rules
APIS ->> APIS: gen hash for each rule
APIS ->> DB: save rules and hashes to database
APIS ->> U: Response
Agent ->> APIS: call interval check rule has been hashed
APIS ->> APIS: compare hashed rule request with hash in db
APIS ->> Agent: response rule + hash if there are changes
Agent ->> Agent: appy new rule and save hash from response
``````

### Flow change rule from Agent

``````mermaid
sequenceDiagram
autonumber
participant APIS as API Server
participant Agent as Agent
participant DB as Database
Agent ->> Agent: interval check rule local
Agent ->> Agent: change rule(delete/append)
Agent ->> APIS: call API get current rule
APIS ->> Agent: response rule + rule hashed
Agent ->> Agent: save rule hashed + apply rule in local
``````

# API-Server --> Agent

### Flow apply rule from API server

``````mermaid
sequenceDiagram
autonumber
actor U as User
participant APIS as API Server
participant DB as Database
participant Agent as Agent
U ->> APIS: apply rule
APIS ->> DB: save rule to database
APIS ->> Agent: Apply rule to Agent
Agent ->> Agent: Save rule and gen hash rule to mem cache
Agent ->> APIS: response
APIS ->> U: response
Agent ->> Agent: check rule is append, replace or delete
Agent ->> Agent: apply rule
``````

### Flow change rule of IPTable from Agent(not allow change)

``````mermaid
sequenceDiagram
autonumber
participant Agent as Agent
participant IPTable as IPTable
Agent ->> IPTable: interval read rule and hash rule
Agent ->> Agent: Check hash rule with current hash rule in mem cache
Agent ->> IPTable: if not match, apply current rule
``````

## hash rule
```go
sha224(currentRule) -> hash
```
