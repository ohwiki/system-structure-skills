# Review Gate

A requirement document passes this gate only if it is stable enough for design and does not secretly redesign the system.

## G1. Problem clarity exists
- [ ] The problem is stated clearly
- [ ] The affected actor or caller is known
- [ ] The desired outcome is clear

## G2. Scope is explicit
- [ ] In-scope behavior is listed
- [ ] Non-goals are listed
- [ ] Adjacent but excluded problems are not ambiguous

## G3. Boundaries and constraints are explicit
- [ ] Important business or compatibility constraints are stated
- [ ] Existing behavior that must not break is identified
- [ ] Security, compliance, or performance constraints are stated when relevant

## G4. Inputs and expected outputs are clear
- [ ] Main scenarios describe inputs and expected outputs
- [ ] Success is externally understandable, not just internally implied

## G5. Acceptance is testable
- [ ] Acceptance criteria exist
- [ ] Acceptance criteria can guide later validation

## G6. Regression protection exists
- [ ] Existing flows, contracts, or behaviors to protect are listed when relevant

## G7. Requirements do not secretly become design
- [ ] The document does not choose frameworks or stacks without requirement-level reason
- [ ] The document does not choose module structure
- [ ] The document does not choose file layout
- [ ] The document does not choose implementation tactics

## Failure signals

The requirement document is not ready if another model would still need to guess:
- what problem is actually being solved
- what is in scope versus out of scope
- what success means
- what existing behavior must be protected
- whether architecture decisions were prematurely embedded in requirements

If those answers require guessing, revise the requirements before design.
