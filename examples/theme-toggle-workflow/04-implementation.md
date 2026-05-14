# 04 Implementation

## Prompt

```text
Use $system-structure-implementation to implement the approved task.
Keep the code inside the approved module, internal unit, dependency rules, and file mapping.
If the task requires structural redesign, stop and report the blocker.
```

## Example execution pattern

### Current task
- Task: T2 Create theme service
- Owning module: Theme application
- Owning unit: ThemeService
- Target files: `src/services/theme-service.*`

### Structural constraints
- May depend on `ThemeStorage`
- Must not move persistence logic into UI control
- Must not place business rules inside generic helpers

### Implementation slice
- Add service methods to:
  - resolve initial theme
  - apply selected theme
  - persist theme through storage adapter

### Validation
- unit tests for service behavior
- confirm service can restore saved theme
- confirm service persists toggled theme

### Structural report
- files changed
- validation result
- whether any mismatch should go back to design or task planning
```
