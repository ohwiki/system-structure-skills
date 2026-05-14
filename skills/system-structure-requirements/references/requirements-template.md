# Requirements Template

Use this template before design begins.

## 1. Problem Statement

State:
- what problem exists now
- who experiences it
- why it matters now

## 2. Goal and Desired Outcome

State:
- what successful change should exist after this work
- what user-visible or system-visible outcome is expected

## 3. Actors and Triggers

Clarify:
- primary actor or caller
- triggering action or event
- main inputs
- expected outputs or visible results

## 4. Scope

List what this work includes.

## 5. Non-Goals

List what this work explicitly does not include.
This section is required.

## 6. Constraints and Boundaries

Define:
- business constraints
- compatibility constraints
- security or compliance constraints if relevant
- performance expectations if known
- existing behavior that must not be broken

## 7. Inputs and Expected Outputs

Recommended table columns:
- Scenario
- Input
- Expected output
- Notes

## 8. Acceptance Criteria

Recommended table columns:
- ID
- Requirement
- How to verify

## 9. Regression Protection Targets

For existing systems, list the behaviors, flows, or contracts that must continue to work.

Recommended table columns:
- Protected behavior
- Why it matters
- How later stages should verify it

## 10. Open Questions or Blockers

List anything that would make design guess.
If critical questions remain, stop and resolve them before design.

## Rules

- Keep the document focused on the problem and expected behavior
- Do not choose architecture here
- Do not choose module or file structure here
- Do not hide implementation decisions inside requirement language
