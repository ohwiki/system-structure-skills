# Diagram Guidance

Diagrams are support tools. Use them only when they clarify structure faster than text or tables.

## When to use a module map

Use a module map when the reader needs to see:
- the top-level system parts
- responsibility boundaries
- dependency direction between major parts

Example:

```mermaid
flowchart LR
    User[User] --> CLI[CLI Module]
    CLI --> App[Application Module]
    App --> Domain[Domain Module]
    App --> StoragePort[Storage Port]
    StoragePort --> FileStore[File Storage Adapter]
```

## When to use an internal structure map

Use an internal structure map when a module contains several units that collaborate and their roles are easy to confuse.

Example:

```mermaid
flowchart TB
    subgraph IndexingModule[Indexing Module]
        Command[Index Command]
        Service[Index Service]
        Parser[Parser]
        Policy[Index Policy]
        Repo[Index Repository]
    end

    Command --> Service
    Service --> Parser
    Service --> Policy
    Service --> Repo
```

## When to use a sequence diagram

Use a sequence diagram when call order or side effects matter.

Example:

```mermaid
sequenceDiagram
    actor User
    participant CLI
    participant Service
    participant Policy
    participant Repo

    User->>CLI: run command
    CLI->>Service: execute request
    Service->>Policy: validate rules
    Policy-->>Service: ok
    Service->>Repo: persist result
    Repo-->>Service: saved
    Service-->>CLI: response
```

## Diagram rules

- Keep names short and structural
- Show dependency direction clearly
- Do not mix too many concerns into one diagram
- Keep diagram labels consistent with module and file names in the tables
- If a table already explains the point better, skip the diagram

## What diagrams must not replace

A diagram must not replace:
- module ownership definition
- dependency rules
- file mapping
- public versus private boundary definition

Those must stay explicit in text or tables.
