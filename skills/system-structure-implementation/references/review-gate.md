# Review Gate

An implementation step passes this gate only if it preserves the approved design and task boundaries.

## G1. Preconditions were respected
- [ ] High-level design existed
- [ ] Detailed design existed
- [ ] Approved task existed
- [ ] Target files were known

## G2. The step stayed inside the task
- [ ] The implementation addressed one approved task or tightly related slice
- [ ] Scope did not silently expand into redesign

## G3. Structural ownership was preserved
- [ ] Logic was placed in the owning module
- [ ] Logic was placed in the owning internal unit
- [ ] No convenience placement crossed structural boundaries

## G4. Dependency rules were preserved
- [ ] Allowed dependencies were respected
- [ ] Forbidden dependencies were not bypassed

## G5. File mapping was preserved
- [ ] Changes landed in expected files or directories
- [ ] No new structural file was introduced without design approval

## G6. Guardrails were preserved
- [ ] The step did not move unrelated responsibilities
- [ ] Generic helpers were not used as a logic dumping ground
- [ ] If a mismatch was discovered, it was surfaced instead of hidden

## G7. Validation happened
- [ ] Validation matched the task risk
- [ ] Structural placement was checked, not only runtime behavior

## Failure signals

The implementation is not ready if another model would still need to guess:
- why the logic was placed in those files
- whether the step violated a module boundary
- whether a new structural decision was made during coding
- whether a design contradiction was silently worked around

If those answers require guessing, revise the implementation or return to design/tasks.
