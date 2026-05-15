# Changelog

All notable changes to this repository will be documented in this file.

## 2026-05-15

### Added
- Initial public repository structure for `system-structure-skills`
- `system-structure-design`
  - two-stage workflow for high-level design and detailed design
  - references for blueprint template, diagram guidance, and review gate
- `system-structure-tasks`
  - task derivation from approved design
  - references for task template and task review gate
- `system-structure-implementation`
  - coding execution workflow that preserves approved design and tasks
  - references for execution template and implementation review gate
- `system-structure-requirements`
  - requirements-first workflow before design begins
  - references for requirements template and requirements review gate
- `README.md`
  - installation instructions
  - workflow guidance
  - usage prompts
  - explanation of what each skill is for
- `README.zh-CN.md`
  - Chinese documentation for installation and workflow usage
- Examples:
  - `examples/theme-toggle-workflow`
  - `examples/cli-config-support-workflow`
  - `examples/legacy-module-refactor-workflow`

### Improved
- clarified the meaning of `implementation` in the workflow
- expanded installation instructions for skills CLI, clone-and-copy, and install script flows
- documented the four-stage workflow end to end:
  - requirements
  - design
  - tasks
  - implementation

## Notes

The repository is currently focused on structure-first AI coding workflows.
Future additions should preserve the same core principle: requirements define the problem, design defines the structure, tasks inherit the design, and implementation executes without silently reshaping the system.
