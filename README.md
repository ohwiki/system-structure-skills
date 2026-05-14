# System Structure Skills

A small skills repository for structure-first AI coding workflows.

These skills are built for one specific goal: before an AI agent writes code, make it understand the problem, shape the system deliberately, derive tasks from that structure, and then carry the same structure through implementation.

The repository currently includes four skills:

- `system-structure-requirements`: define stable requirements before design begins
- `system-structure-design`: produce a two-stage design before implementation
- `system-structure-tasks`: derive executable tasks from the approved design without inventing new structure
- `system-structure-implementation`: implement approved tasks without reshaping the system during coding

The workflow is simple:

1. define the problem and acceptance boundaries with requirements
2. define the system frame with high-level design
3. refine the internal shape with detailed design
4. derive tasks that inherit the design instead of redesigning it
5. implement each task without drifting away from the blueprint

This is meant to reduce a common failure mode in AI coding: the model starts implementing too early, mixes responsibilities, creates arbitrary files, and slowly drifts away from a coherent system shape.

## Why these skills exist

Most AI coding workflows are good at generating code, but weak at preserving shape.

The real problem is usually not that the model cannot code. The problem is that it does not have a good blueprint:

- what problem is actually being solved
- what is in scope and out of scope
- which existing behaviors must not regress
- which top-level modules exist
- how those modules break down internally
- what dependencies are allowed or forbidden
- where logic should land in files
- how tasks should inherit the design
- how coding should preserve the design instead of mutating it

These skills try to solve that problem directly.

## Skills

### `system-structure-requirements`

Use this skill first.

It defines:

- the problem statement
- the desired outcome
- actors and triggers
- scope and non-goals
- constraints and boundaries
- inputs and expected outputs
- acceptance criteria
- regression protection targets

This skill is intentionally strict: requirements define what must be achieved and protected. They do not choose architecture or file structure.

### `system-structure-design`

Use this skill after requirements are stable.

It produces a two-stage design:

- **High-level design**
  - system boundary
  - non-goals
  - framework and technology choices
  - top-level modules
  - system calls and external integrations
  - major constraints

- **Detailed design**
  - internal unit breakdown inside important modules
  - responsibilities and non-responsibilities
  - allowed and forbidden dependencies
  - public versus private interfaces
  - critical flows
  - file and directory mapping

This skill is for cases where you want the model to understand the system like a buildable blueprint before implementation.

### `system-structure-tasks`

Use this skill after the design is approved.

It turns the design into executable implementation tasks while preserving:

- high-level design boundaries
- detailed design responsibilities
- dependency rules
- file mappings
- implementation guardrails

This skill is intentionally strict: tasks inherit structure. They do not redesign structure.

### `system-structure-implementation`

Use this skill after tasks are approved.

It carries the design and task constraints into coding itself. It is meant for implementation phases where the model must not quietly redesign the system for convenience.

It preserves:

- approved design
- approved tasks
- module and unit ownership
- dependency rules
- file mappings
- validation expectations

This skill is intentionally strict: implementation executes structure. It does not redesign structure.

#### What "implementation" means here

In this repository, `implementation` does **not** mean "a business feature implementation written by this repository".

It means the **coding execution phase** of the workflow:

1. requirements define the problem
2. design defines the blueprint
3. tasks define the work packages
4. implementation executes one approved task in code

The purpose of this skill is to keep the model from drifting during coding. It forces the model to keep asking:

- which approved task is being implemented
- which module owns this logic
- which internal unit owns this logic
- which files should change
- which dependencies are allowed
- when coding must stop and go back to design or task planning

Without this stage, models often do the earlier design work correctly, then break structure during coding by:

- putting logic in the wrong module
- adding ad hoc layers for convenience
- bypassing dependency boundaries
- turning shared helpers into dumping grounds
- silently reshaping the system while "just implementing"

This skill exists to prevent that.

## Recommended workflow

The intended workflow is:

```text
system-structure-requirements -> review and approve requirements -> system-structure-design -> review and approve design -> system-structure-tasks -> approve tasks -> system-structure-implementation
```

### Step 1: define requirements

Example prompt:

```text
Use $system-structure-requirements to define the problem, scope, constraints, acceptance criteria, and regression targets before design begins.
Do not choose architecture or file structure in the requirements phase.
```

Chinese example:

```text
用 $system-structure-requirements 先写需求，不要做设计。
先明确问题、范围、非目标、约束、验收标准和回归保护对象，不要提前决定架构、模块和文件结构。
```

### Step 2: produce the design

Example prompt:

```text
Use $system-structure-design to produce both a high-level design and a detailed design before implementation.
The high-level design must clearly define what it decides and what it leaves to detailed design.
The detailed design must clearly define what it decides and what it leaves to implementation.
```

Chinese example:

```text
用 $system-structure-design 先做两阶段设计，不要写代码。
先做概要设计：明确系统边界、技术栈、主模块、系统调用和概要设计不负责的内容。
再做详细设计：明确模块内部结构、职责边界、依赖规则、文件落点和详细设计不负责的内容。
```

### Step 3: review and approve the design

Do not rush into tasks.

The design should be strong enough that another model can answer without guessing:

- what the system owns
- what each module owns
- what each internal unit owns
- where new logic should go
- where new logic must not go
- which files implement which structural units

### Step 4: derive implementation tasks

Example prompt:

```text
Use $system-structure-tasks to derive executable tasks from the approved design.
The tasks must inherit module boundaries, internal unit responsibilities, dependency rules, and file mappings.
Do not invent new structure in the task phase.
```

Chinese example:

```text
用 $system-structure-tasks 按已经确认的设计拆任务。
任务必须继承模块边界、内部结构、依赖规则和文件落点，不能在任务阶段重新发明结构。
```

### Step 5: implement one task at a time

Example prompt:

```text
Use $system-structure-implementation to implement the approved task.
Keep the code inside the approved module, internal unit, dependency rules, and file mapping.
If the task requires structural redesign, stop and report the blocker.
```

Chinese example:

```text
用 $system-structure-implementation 实现已经批准的任务。
实现必须遵守模块边界、内部单元职责、依赖规则和文件落点；如果需要改结构，先停下来报告，不要直接改写设计。
```

What this step means in practice:

- it is **not** a fresh architecture discussion
- it is **not** another task-planning phase
- it is **not** permission to invent new structure while coding
- it **is** the phase where the model writes code under the constraints already decided earlier

## When to use these skills

Use these skills when:

- the feature is large enough that implementation shape matters
- the codebase already has structure that should be preserved
- a new service or subsystem is being introduced
- you want the model to stop guessing where logic belongs
- you want tasks that trace back to design
- you want coding to preserve the approved structure instead of mutating it

They are especially useful for:

- requirements clarification before architecture work
- architecture or structure planning
- medium or large feature work
- refactors that must preserve boundaries
- plugin or service design
- multi-module changes

## When not to use them

These skills are usually too heavy for:

- tiny one-file scripts
- throwaway automation
- trivial local fixes
- simple cosmetic changes

## Installation

You can install these skills in three common ways:

1. with `skills` CLI
2. by cloning the repository and copying the `skills/` folders
3. by using the included install script

The exact target directory depends on your agent environment.

### Where these skills should go

Typical locations are:

| Environment | Typical skills directory |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex local skills | `~/.codex/skills/` or `$CODEX_HOME/skills/` |
| Project-local agent setup | `<project>/.claude/skills/` or equivalent local skills directory |

If your agent already supports loading a skills repository directly, use that mechanism instead of copying files manually.

### Option 1: install all skills with skills CLI

```bash
npx skills add ohwiki/system-structure-skills -g --all
```

What this does:

- downloads the repository
- installs all skills under your global skills directory
- makes them available by skill name

### Option 1a: install one skill only

```bash
npx skills add ohwiki/system-structure-skills -g --skill system-structure-requirements
npx skills add ohwiki/system-structure-skills -g --skill system-structure-design
npx skills add ohwiki/system-structure-skills -g --skill system-structure-tasks
npx skills add ohwiki/system-structure-skills -g --skill system-structure-implementation
```

### Option 1b: list available skills

```bash
npx skills add ohwiki/system-structure-skills -l
```

### Option 2: install by cloning and copying

Clone the repository:

```bash
git clone https://github.com/ohwiki/system-structure-skills.git ~/.claude/plugins/system-structure-skills
```

Then copy the individual skill directories under `skills/` into your agent's skills directory.

Example for Claude Code:

```bash
mkdir -p ~/.claude/skills
cp -R ~/.claude/plugins/system-structure-skills/skills/* ~/.claude/skills/
```

Example for Codex local skills:

```bash
mkdir -p ~/.codex/skills
cp -R ~/.claude/plugins/system-structure-skills/skills/* ~/.codex/skills/
```

### Option 3: use the included install script

If you already cloned the repository, you can run:

```bash
cd system-structure-skills
bash scripts/install.sh
```

By default, this script installs the skills into:

```bash
~/.claude/skills
```

If you want Codex to discover them from `~/.codex/skills`, either copy them there manually or adjust the script for your local environment.

## Verify installation

After installation, confirm that these directories exist in your target skills folder:

```text
system-structure-requirements/
system-structure-design/
system-structure-tasks/
system-structure-implementation/
```

You should also be able to invoke them by name:

- `$system-structure-requirements`
- `$system-structure-design`
- `$system-structure-tasks`
- `$system-structure-implementation`

## Quick start after installation

A minimal end-to-end flow looks like this:

1. write requirements
2. design from requirements
3. derive tasks from design
4. implement one approved task at a time

Minimal prompts:

```text
Use $system-structure-requirements to define the problem before design.
Use $system-structure-design to produce high-level and detailed design.
Use $system-structure-tasks to derive executable tasks from the approved design.
Use $system-structure-implementation to implement one approved task without reshaping the system.
```

## Repository structure

```text
system-structure-skills/
├── README.md
├── .gitignore
├── scripts/
│   └── install.sh
└── skills/
    ├── system-structure-requirements/
    │   ├── SKILL.md
    │   ├── agents/
    │   │   └── openai.yaml
    │   └── references/
    │       ├── requirements-template.md
    │       └── review-gate.md
    ├── system-structure-design/
    │   ├── SKILL.md
    │   ├── agents/
    │   │   └── openai.yaml
    │   └── references/
    │       ├── diagram-guidance.md
    │       ├── review-gate.md
    │       └── system-blueprint-template.md
    ├── system-structure-tasks/
    │   ├── SKILL.md
    │   ├── agents/
    │   │   └── openai.yaml
    │   └── references/
    │       ├── review-gate.md
    │       └── task-template.md
    └── system-structure-implementation/
        ├── SKILL.md
        ├── agents/
        │   └── openai.yaml
        └── references/
            ├── execution-template.md
            └── review-gate.md
```

## Examples

Two end-to-end examples are included:

- [examples/theme-toggle-workflow](./examples/theme-toggle-workflow)
  - frontend-oriented example
  - add light/dark theme switching
  - show how state, UI, persistence, and file mapping are handled across all four stages

- [examples/cli-config-support-workflow](./examples/cli-config-support-workflow)
  - backend/tooling-oriented example
  - add configuration file support to an existing CLI
  - show how compatibility, precedence rules, parsing boundaries, and regression protection flow through all four stages

## Design philosophy

These skills are built around a few hard ideas:

- requirements, design, tasks, and implementation are different stages
- each stage must define what it does and what it does not do
- requirements define the problem and acceptance boundaries without prematurely choosing architecture
- high-level design and detailed design are different stages
- detailed design must connect structure to files
- tasks must inherit design rather than silently rewriting it
- implementation must inherit both design and tasks rather than reshaping the system during coding
- diagrams help, but structure and file landing points matter more than diagrams

## License

MIT
