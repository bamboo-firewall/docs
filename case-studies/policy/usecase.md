# Agent --> API-Server

### Flow apply rule from API server

``````mermaid
sequenceDiagram
autonumber
actor U as User
participant APIS as API Server
participant Agent as Agent
participant DB as Database
U ->> APIS: apply rule
APIS ->> APIS: gen hash
APIS ->> DB: save rule and hash to database
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
participant Agent as Agent
participant DB as Database
U ->> APIS: apply rule
APIS ->> APIS: gen hash
APIS ->> DB: save rule and hash to database
APIS ->> Agent: Apply rule to Agent
Agent ->> Agent: Save rule to file and apply
Agent ->> APIS: response
APIS ->> U: response
``````

### Flow change rule from Agent

``````mermaid
sequenceDiagram
autonumber
participant Agent as Agent
Agent ->> Agent: read file and interval check rule local
Agent ->> Agent: if change, apply rule current in file
``````
