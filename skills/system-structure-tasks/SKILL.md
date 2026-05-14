---
name: system-structure-tasks
description: Derive implementation tasks from approved high-level design and detailed design without inventing new structure. Use when Codex needs to break a designed system or feature into executable tasks while preserving module boundaries, internal unit responsibilities, dependency rules, and file mappings. Trigger for requests about task breakdown, implementation sequencing, work packages, coding plan generation, or turning a design blueprint into safe executable steps.
---

# System Structure Tasks

## Overview

Use this skill after a system has already been designed with high-level and detailed design. The purpose is to turn the approved design into executable tasks without letting the task phase invent new modules, new boundaries, or new file structure.

## Core principle

Tasks inherit structure. They do not redesign structure.

A task breakdown must preserve:
- high-level design boundaries
- detailed design responsibilities and non-responsibilities
- allowed and forbidden dependencies
- file and directory mapping
- implementation guardrails

If the task list changes the structure, the task list is wrong.

## Preconditions

Before generating tasks, confirm that design artifacts already exist and are stable enough.
The required inputs are:
- approved high-level design
- approved detailed design
- file and directory mapping
- boundary and dependency rules
- risks or guardrails

If these are missing or unclear, stop and ask for design completion first.

## What this stage does

This stage does:
- turn design units into implementable tasks
- sequence tasks in dependency order
- separate foundation tasks from feature tasks
- preserve module and unit boundaries
- assign each task to specific files, symbols, or units where possible
- define validation for each task
- identify tasks that must happen before others

## What this stage does not do

This stage does not:
- create new modules or units
- re-decide architecture
- move responsibilities across boundaries
- invent shortcuts that violate dependency rules
- hide missing design by pushing decisions into implementation tasks

If a needed task cannot be defined without changing the design, stop and send the problem back to design.

## Workflow

### 1. Read the design inputs

Extract:
- top-level modules
- internal units
- dependency rules
- file mapping
- critical flows
- risks and guardrails

### 2. Identify task anchors

Anchor tasks to the design, not to vague goals.
Typical anchors are:
- module creation or update
- internal unit implementation
- interface or contract implementation
- validation or policy implementation
- adapter or integration implementation
- file skeleton creation
- tests tied to a specific risk or flow

### 3. Split tasks by structural ownership

Each task should belong to one clear design owner when possible:
- one module
- one internal unit
- one file group
- one interface boundary

Avoid tasks that span unrelated modules unless the task is integration glue required by the design.

### 4. Sequence tasks conservatively

Prefer this order when applicable:
1. file or module skeleton tasks
2. contract or interface tasks
3. core internal unit tasks
4. adapter or integration tasks
5. critical flow wiring tasks
6. validation and regression tasks
7. documentation or cleanup tasks tied to the design

### 5. Define task contents precisely

For each task, specify:
- task name
- purpose
- design section or unit it traces to
- target files or directories
- what it does
- what it must not change
- dependency on previous tasks
- validation method

### 6. Stop on design gaps

Do not patch over design gaps.
If you discover one of these, stop and flag it:
- file mapping missing
- unit responsibility unclear
- dependency rule missing
- critical flow placement unclear
- architecture contradiction between high-level and detailed design

## Required output structure

Unless the user explicitly narrows the task, produce:
1. Preconditions check
2. Task sequencing assumptions
3. Task list
4. Dependency notes between tasks
5. Validation plan
6. Design gaps or blockers if any

## Task quality bar

A good task:
- belongs to a clear structural owner
- maps to known files or directories
- has a clear validation method
- does not require architecture invention during execution
- states what it must not change when the boundary matters

A bad task:
- says only "implement feature X"
- spans unrelated modules without explanation
- leaves file targets undefined
- requires the implementer to guess boundaries
- changes structure that was never approved in design

## Definition of done

The task plan is not done unless another model can answer:
- Which design unit does this task belong to?
- Which files should this task touch?
- What must this task avoid changing?
- Which previous task does this depend on?
- How will we verify the task is done?

If those answers are not obvious, refine the task list.

## Output style

Use concise engineering prose.
Use tables for task lists and dependency notes when helpful.
Keep tasks small enough that validation is straightforward.

## References

Load [references/task-template.md](references/task-template.md) when drafting the task plan.
Load [references/review-gate.md](references/review-gate.md) to self-check whether the task breakdown still respects the design.
