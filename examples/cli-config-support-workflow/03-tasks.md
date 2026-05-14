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
| T1 | Add config locator | Config loading | ConfigLocator | `src/config/config-locator.*` | Find supported config file path(s) | Must not parse config contents | - | locator tests |
| T2 | Add config parser | Config loading | ConfigParser | `src/config/config-parser.*` | Parse config file into structured values | Must not merge precedence rules | T1 | parser tests |
| T3 | Add option resolver | Option resolution | OptionResolver | `src/config/option-resolver.*` | Merge defaults, config values, and CLI flags | Must not perform command execution | T2 | precedence tests |
| T4 | Wire CLI entry to resolved options | CLI entry | command bootstrap | CLI entry files | Ensure commands receive resolved options | Must not rewrite existing handlers unnecessarily | T3 | integration tests |
| T5 | Add invalid-config error path checks | validation | tests | test files | Verify clear error handling for invalid config | Must not change success path behavior | T2-T4 | error-path tests |
| T6 | Add regression checks for old flag-only usage | regression | tests | test files | Preserve current no-config workflows | Must not redesign CLI UX | T4-T5 | regression suite |
```
