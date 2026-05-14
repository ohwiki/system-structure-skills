# Review Gate

A task plan passes this gate only if it preserves the approved design.

## G1. Design prerequisites exist
- [ ] High-level design exists
- [ ] Detailed design exists
- [ ] File mapping exists
- [ ] Boundary and dependency rules exist

## G2. Tasks inherit design rather than redesign it
- [ ] No task creates an unapproved module or unit
- [ ] No task silently moves responsibilities across boundaries
- [ ] No task violates dependency rules for convenience

## G3. Structural ownership is clear
- [ ] Each task belongs to a clear module, unit, or file group
- [ ] Cross-module tasks are justified by the design

## G4. File targets are concrete
- [ ] Structurally important tasks identify target files or directories
- [ ] Tasks do not leave file placement to guesswork

## G5. Guardrails are preserved
- [ ] Tasks state what must not be changed when boundary risk exists
- [ ] Risky flows have matching validation tasks

## G6. Task order respects structure
- [ ] Foundational tasks come before dependent tasks
- [ ] Interface tasks precede adapter or integration tasks when required
- [ ] Validation tasks cover the important risks

## G7. Design gaps are surfaced
- [ ] Missing design decisions are listed as blockers instead of being hidden in tasks

## Failure signals

The task plan is not ready if another model would still need to guess:
- which module or unit a task belongs to
- which files a task should modify
- whether a task is allowed to reshape structure
- what a task must avoid changing
- whether a missing design choice was silently pushed into implementation

If those answers require guessing, revise the task plan or return to design.
