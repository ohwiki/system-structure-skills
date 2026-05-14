# Review Gate

A design passes this gate only if it can keep implementation from drifting.
A valid design now requires both high-level design and detailed design.

## G1. System purpose is explicit
- [ ] The system or feature purpose is stated clearly
- [ ] The main trigger or user is known
- [ ] Non-goals are listed

## G2. High-level design exists
- [ ] The system boundary is described
- [ ] The project context and major constraints are stated
- [ ] Framework, runtime, or technology choices are explained when they matter
- [ ] External systems and integration boundaries are defined
- [ ] Top-level modules are identified

## G3. High-level design boundaries are explicit
- [ ] It is clear what the high-level design decides
- [ ] It is clear what the high-level design intentionally leaves for detailed design
- [ ] The design does not jump from system framing straight into low-level detail

## G4. Top-level modules are defined well
- [ ] Each top-level module has a clear purpose
- [ ] Ownership of behavior or state is explicit
- [ ] Each module has responsibilities it must not absorb

## G5. Detailed design structure is chosen intentionally
- [ ] The design states which detailed structure levels are used
- [ ] The chosen levels match the real problem
- [ ] The design does not force meaningless vocabulary

## G6. Detailed design boundaries are explicit
- [ ] It is clear what the detailed design decides
- [ ] It is clear what remains implementation-level choice
- [ ] The detailed design is deep enough to constrain placement but not line-by-line coding

## G7. Internal units are defined where needed
- [ ] Important modules are broken down into internal units
- [ ] Each unit has a clear role
- [ ] Each unit has clear non-responsibilities
- [ ] Public versus private internal units are distinguishable

## G8. Boundary and dependency rules are explicit
- [ ] Allowed dependencies are stated
- [ ] Forbidden dependencies are stated
- [ ] Rules are written as constraints, not vague advice

## G9. File mapping is concrete
- [ ] Modules map to directories or files
- [ ] Internal units map to directories or files
- [ ] Entry points and private implementation files are distinguishable
- [ ] Files include what must not be added there

## G10. Critical flows reinforce structure
- [ ] At least the risky flows are described
- [ ] The flow shows where validation belongs
- [ ] The flow shows where state change and side effects belong
- [ ] Failure or fallback behavior is covered where relevant

## G11. Decisions are recorded
- [ ] Major structural choices are explained
- [ ] Rejected alternatives are named
- [ ] Consequences for implementation are stated

## G12. Risks and guardrails exist
- [ ] Likely implementation drift points are listed
- [ ] There are prevention rules for those drift points
- [ ] There is a validation method for the main risks

## Failure signals

The design is not ready if another model would still need to guess:
- what high-level frame was chosen
- what high-level design intentionally did not decide
- why a framework or stack choice matters
- where the system boundary is
- what detailed design intentionally left to implementation
- where to add new logic
- where not to add new logic
- what each module owns
- how the module breaks down internally
- which dependency shortcuts are forbidden
- how the structure lands in files

If those answers require guessing, revise the design before implementation.
