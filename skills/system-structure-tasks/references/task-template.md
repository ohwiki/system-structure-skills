# Task Template

Use this template to convert approved high-level design and detailed design into executable tasks.

## 1. Preconditions Check

Confirm:
- high-level design exists
- detailed design exists
- file mapping exists
- dependency rules exist
- no blocking design contradictions remain

## 2. Task Sequencing Assumptions

State the task ordering logic.
Examples:
- file skeletons before behavior
- interfaces before adapters
- validation before risky integration glue

## 3. Task List

Recommended table columns:
- Task ID
- Task name
- Belongs to module
- Belongs to unit
- Target files or directories
- Purpose
- Must not change
- Depends on
- Validation

## 4. Dependency Notes Between Tasks

Describe the important task dependencies in prose when the table is not enough.
Focus on structural reasons, not generic scheduling reasons.

## 5. Validation Plan

Group the verification work.
Examples:
- unit tests for policy placement
- integration tests for adapter boundaries
- regression tests for protected flows

Recommended table columns:
- Validation type
- Covers which tasks
- What it proves

## 6. Design Gaps or Blockers

If tasks cannot be safely written without inventing structure, stop here.
List:
- missing design decision
- affected module or unit
- why implementation would guess
- what must be clarified before continuing

## Rules

- Every task must trace back to a design element
- Every structurally important task should have file targets
- Every risky task should state what it must not change
- Do not create tasks that silently redesign modules or boundaries
