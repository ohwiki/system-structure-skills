---
name: system-structure-implementation
description: Implement code from approved high-level design, detailed design, and task breakdown without reshaping the system. Use when Codex needs to execute coding work while preserving module boundaries, internal unit responsibilities, dependency rules, file mappings, and task sequencing from the design artifacts. Trigger for requests about implementing an already designed feature, executing approved tasks, coding within structure constraints, or carrying a design blueprint safely through to code.
---

# System Structure Implementation

## Overview

Use this skill after design and task planning are already approved. The purpose is to keep the implementation phase from drifting away from the blueprint.

## Core principle

Implementation executes structure. It does not redesign structure.

Code changes must inherit:
- approved high-level design
- approved detailed design
- approved task breakdown
- module and unit boundaries
- dependency rules
- file and directory mapping
- validation and regression requirements

If coding requires architecture invention, stop and return to design or tasks.

## Preconditions

Before implementing, confirm that the following exist:
- approved high-level design
- approved detailed design
- approved task list
- target files or file groups
- validation plan

If any of these are unclear, stop and ask for clarification before coding.

## What this stage does

This stage does:
- implement one approved task at a time
- place logic in the files and units defined by the design
- preserve module boundaries and dependency rules
- keep validation close to implementation
- surface design contradictions instead of silently working around them

## What this stage does not do

This stage does not:
- create new structural layers unless explicitly approved by design revision
- move logic into a more convenient but wrong module
- bypass dependency constraints for speed
- turn shared helpers into a dumping ground
- silently reinterpret task boundaries
- hide design gaps inside implementation detail

## Workflow

### 1. Re-read the relevant design slice

Before each task, extract only what matters for that task:
- owning module
- owning internal unit
- target files
- allowed dependencies
- forbidden dependencies
- validation expected

### 2. Implement the smallest approved slice

Make the change in the narrowest place that satisfies the task.
Prefer minimal edits that preserve the existing structure.

### 3. Keep structural discipline during coding

While implementing, check:
- does this logic belong in this module?
- does this logic belong in this internal unit?
- does this file already own this responsibility?
- am I crossing a forbidden dependency boundary?
- am I introducing structure that design never approved?

If any answer is uncertain, stop and escalate back to design or tasks.

### 4. Validate immediately

Run or describe the validation tied to the task:
- unit test
- integration test
- regression check
- manual structural verification when needed

### 5. Report what changed structurally

For each completed task, report:
- files changed
- design unit implemented
- validation performed
- whether any design tension was discovered

## Required output behavior

Unless the user explicitly asks otherwise, implement with this behavior:
1. restate the current task in design terms
2. identify target files
3. implement only that slice
4. validate the change
5. report structural compliance or blockers

## Escalation conditions

Stop and return to design or task planning if:
- the task requires a new module or unit not present in design
- the file mapping is wrong or missing
- the dependency rule blocks the current implementation and no approved workaround exists
- the design and tasks contradict each other
- the only way forward is to place logic in the wrong structural owner

## Implementation quality bar

A good implementation step:
- completes one approved task
- respects module and unit ownership
- touches the expected files only
- preserves dependency rules
- includes validation

A bad implementation step:
- solves the problem by adding structure ad hoc
- spreads one task across unrelated modules
- pushes business logic into generic helpers
- hides a design gap by coding around it

## Definition of done

A coding step is not done unless another model can answer:
- which task was implemented
- which design unit it belongs to
- which files were changed
- why the logic belongs there
- how the change was validated
- whether any design mismatch remains

## Output style

Use concise engineering prose.
Stay tightly scoped to the approved task.
Prefer small validated increments over large speculative edits.

## References

Load [references/execution-template.md](references/execution-template.md) when reporting or planning a task implementation slice.
Load [references/review-gate.md](references/review-gate.md) to self-check whether the implementation still respects the design and task boundaries.
