# 02 Design

## Prompt

```text
Use $system-structure-design to produce both a high-level design and a detailed design before implementation.
The high-level design must clearly define what it decides and what it leaves to detailed design.
The detailed design must clearly define what it decides and what it leaves to implementation.
Base it on the approved legacy refactor requirements.
```

## Example output shape

### High-level design
- Project type: maintenance refactor in an existing CLI or service codebase
- System boundary: existing command execution path remains the same externally
- Top-level structural intent:
  - command entry remains the public entrypoint
  - service owns orchestration
  - policy owns business validation or decision logic
  - adapter owns external interaction or infrastructure access
- High-level design decides the target separation of responsibilities
- High-level design does not yet decide every helper or local utility split

### Detailed design
- Existing oversized file is analyzed as mixing three concerns:
  - orchestration
  - business rule evaluation
  - external system interaction
- Target internal units:
  - `CommandService`
  - `CommandPolicy`
  - `ExternalAdapter`
- Dependency rules:
  - entrypoint may call service only
  - service may call policy and adapter
  - policy must not call adapter directly
  - adapter must not contain business decision rules
- File mapping:
  - `src/commands/run-command.*` stays as entrypoint
  - `src/services/command-service.*`
  - `src/policies/command-policy.*`
  - `src/adapters/external-adapter.*`
- Critical flow:
  - entrypoint parses request -> service orchestrates -> policy validates/decides -> adapter performs external action -> service shapes result -> entrypoint returns output
```
