# 04 Implementation

## Prompt

```text
Use $system-structure-implementation to implement the approved task.
Keep the code inside the approved module, internal unit, dependency rules, and file mapping.
If the task requires structural redesign, stop and report the blocker.
```

## Example execution pattern

### Current task
- Task: T2 Extract policy logic
- Owning module: Business rules
- Owning unit: CommandPolicy
- Target files: `src/policies/command-policy.*`

### Structural constraints
- May receive normalized input from service
- Must not call external systems directly
- Must not stay embedded in the entrypoint or adapter files
- Must not absorb response formatting concerns

### Implementation slice
- Move business decision logic and validation rules from the oversized legacy module into `CommandPolicy`
- Expose only the policy outputs needed by the service
- Leave orchestration and external interaction outside policy

### Validation
- existing rule behavior preserved in tests
- policy tests cover valid and invalid paths
- end-to-end command tests show no user-facing regression

### Structural report
- files changed
- validation result
- whether any mismatch should go back to design or task planning
```
