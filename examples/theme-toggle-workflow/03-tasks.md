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
| T1 | Create theme storage adapter | Theme persistence | ThemeStorage | `src/adapters/theme-storage.*` | Read/write user theme preference | Must not contain UI logic | - | storage unit tests |
| T2 | Create theme service | Theme application | ThemeService | `src/services/theme-service.*` | Apply theme and coordinate persistence | Must not access DOM through UI component code | T1 | service tests |
| T3 | Add theme toggle control | Theme UI | ThemeToggleControl | `src/components/theme-toggle.*` | Let user switch theme | Must not own persistence logic | T2 | component interaction tests |
| T4 | Wire startup restore flow | Theme application | startup integration | app entry files | Restore persisted theme on app start | Must not redesign app boot flow | T2 | startup regression test |
| T5 | Add regression checks | cross-cutting verification | tests | relevant test files | Ensure existing pages still work in both themes | Must not redesign modules | T1-T4 | regression suite |
```
