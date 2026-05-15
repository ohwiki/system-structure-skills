# 03 Tasks

## Prompt

```text
Use $system-structure-tasks to derive executable tasks from the approved design.
The tasks must inherit module boundaries, internal unit responsibilities, dependency rules, and file mappings.
Do not invent new structure in the task phase.
```

## Example output shape

| Task ID | Task name | Belongs to module | Belongs to unit | Target files | Purpose | Must not change | Depends on | Validation |
|---|---|---|---|---|---|---|---|---|
| T1 | Introduce service skeleton | Orchestration | CommandService | `src/services/command-service.*` | Create orchestration home for the command | Must not change user-facing command behavior | - | service skeleton test or compile check |
| T2 | Extract policy logic | Business rules | CommandPolicy | `src/policies/command-policy.*` | Move validation and decision rules out of the legacy module | Must not call external systems directly | T1 | policy behavior tests |
| T3 | Extract external calls into adapter | Infrastructure interaction | ExternalAdapter | `src/adapters/external-adapter.*` | Move external integration logic out of legacy module | Must not own business rules | T1 | adapter integration tests |
| T4 | Rewire entrypoint through service | Command entry | command entrypoint | entrypoint + service files | Keep public command shape stable while routing through new structure | Must not change CLI syntax | T2-T3 | end-to-end command test |
| T5 | Remove duplicated legacy logic | cleanup | legacy module cleanup | legacy file + new files | Delete or thin the old mixed-responsibility paths | Must not remove regression coverage first | T4 | regression suite |
| T6 | Add regression checks | regression | tests | test files | Preserve existing outputs and error paths | Must not redesign command semantics | T1-T5 | regression suite |
```
