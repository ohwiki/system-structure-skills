---
name: system-structure-requirements
description: Define requirements before design begins, including the problem, scope, boundaries, actors, constraints, acceptance criteria, and regression protection targets without prematurely deciding architecture or implementation. Use when Codex needs to clarify what should be built, what should not be built, and what later design and implementation must satisfy. Trigger for requests about requirement writing, product or feature scoping, requirement clarification, acceptance criteria, boundaries, non-goals, or pre-design problem framing.
---

# System Structure Requirements

## Overview

Use this skill as the first stage of the workflow. Its job is to make the problem stable before design starts.

## Core principle

Requirements define what must be achieved and what must be protected.
They do not decide architecture, file layout, or coding structure.

A good requirement document should make later design possible without forcing the model to guess the problem.

## What this stage does

This stage does:
- define the problem to solve
- define who the user, trigger, or external actor is
- define scope and non-goals
- define business boundaries
- define constraints that later stages must respect
- define expected behavior and acceptance outcomes
- define regression protection targets when modifying existing systems

## What this stage does not do

This stage does not:
- choose framework or technology stack
- choose module structure
- choose file layout
- choose internal unit boundaries
- choose implementation tactics
- silently mix design decisions into requirements

If the requirement document already chooses architecture, it has gone too far.

## Workflow

### 1. Define the problem

State:
- what problem exists now
- why it matters
- what outcome is needed

### 2. Define actors and triggers

Clarify:
- who uses the feature or system
- what external event or user action triggers it
- what input enters the system
- what output or visible result should occur

### 3. Define scope and non-goals

List:
- what is in scope
- what is explicitly out of scope
- what adjacent problems are not being solved here

### 4. Define constraints and boundaries

Clarify:
- business constraints
- compatibility constraints
- performance or latency expectations if known
- security or compliance constraints if relevant
- existing behavior that must not be broken

### 5. Define acceptance and regression expectations

State:
- what success looks like
- what must be testable later
- what existing flows or behaviors must continue to work

## Required output structure

Unless the user explicitly narrows the task, produce these sections:
1. Problem statement
2. Goal and desired outcome
3. Actors and triggers
4. Scope
5. Non-goals
6. Constraints and boundaries
7. Inputs and expected outputs
8. Acceptance criteria
9. Regression protection targets
10. Open questions or blockers

## Quality bar

A good requirement document:
- is specific about the problem
- is specific about boundaries
- is specific about success
- leaves architecture to the design stage
- gives later stages enough clarity to avoid guessing

A bad requirement document:
- jumps straight to frameworks or module structure
- says only "build feature X"
- has no non-goals
- has no acceptance criteria
- ignores existing behavior that must be protected

## Definition of done

The requirement document is not done unless another model can answer:
- what problem is being solved
- who triggers the behavior
- what is in scope
- what is out of scope
- what constraints later stages must respect
- what success looks like
- what existing behavior must not regress

If those answers are not obvious, refine the requirements before design.

## Output style

Use concise engineering prose.
Prefer lists and tables for acceptance criteria and regression targets.
Do not hide design decisions inside requirement language.

## References

Load [references/requirements-template.md](references/requirements-template.md) when drafting the requirement document.
Load [references/review-gate.md](references/review-gate.md) to self-check whether the requirements are stable enough for design.
