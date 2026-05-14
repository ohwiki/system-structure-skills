# 04 Implementation

## Prompt

```text
Use $system-structure-implementation to implement the approved task.
Keep the code inside the approved module, internal unit, dependency rules, and file mapping.
If the task requires structural redesign, stop and report the blocker.
```

## Example execution pattern

### Current task
- Task: T3 Add option resolver
- Owning module: Option resolution
- Owning unit: OptionResolver
- Target files: `src/config/option-resolver.*`

### Structural constraints
- May depend on parsed config output and CLI args representation
- Must not read files directly
- Must not live inside command handlers
- Must not push precedence logic into generic utility helpers

### Implementation slice
- Add resolver logic to:
  - start from built-in defaults
  - overlay config file values
  - overlay explicit CLI flags last
  - return a resolved option object for command execution

### Validation
- precedence tests confirm: CLI flags > config file > defaults
- no-config path confirms old behavior stays unchanged
- invalid config path remains handled outside resolver

### Structural report
- files changed
- validation result
- whether any mismatch should go back to design or task planning
```
