# Execution Template

Use this template when implementing one approved task from the design and task plan.

## 1. Current Task

State:
- task ID or task name
- owning module
- owning internal unit
- target files or directories

## 2. Structural Constraints

State:
- allowed dependencies
- forbidden dependencies
- what this step must not change
- why the logic belongs in the chosen files

## 3. Implementation Slice

Describe the smallest approved change being implemented now.
Do not broaden scope.

## 4. Validation

State the validation for this slice.
Examples:
- unit test
- integration test
- regression check
- manual structural verification

## 5. Structural Report

After implementation, report:
- files changed
- task completed
- design unit implemented
- validation result
- any mismatch that should go back to design or tasks
