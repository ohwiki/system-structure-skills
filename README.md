# System Structure Skills

A small skills repository for structure-first AI coding workflows.

These skills are built for one specific goal: before an AI agent writes code, make it understand how the system should be shaped, then carry that shape through tasks and implementation.

The repository currently includes three skills:

- `system-structure-design`: produce a two-stage design before implementation
- `system-structure-tasks`: derive executable tasks from the approved design without inventing new structure
- `system-structure-implementation`: implement approved tasks without reshaping the system during coding

The workflow is simple:

1. define the system frame with high-level design
2. refine the internal shape with detailed design
3. derive tasks that inherit the design instead of redesigning it
4. implement each task without drifting away from the blueprint

This is meant to reduce a common failure mode in AI coding: the model starts implementing too early, mixes responsibilities, creates arbitrary files, and slowly drifts away from a coherent system shape.

## Why these skills exist

Most AI coding workflows are good at generating code, but weak at preserving shape.

The real problem is usually not that the model cannot code. The problem is that it does not have a good blueprint:

- what the system is supposed to do
- what it is not supposed to do
- which top-level modules exist
- how those modules break down internally
- what dependencies are allowed or forbidden
- where logic should land in files
- how tasks should inherit the design
- how coding should preserve the design instead of mutating it

These skills try to solve that problem directly.

## Skills

### `system-structure-design`

Use this skill before coding.

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

1. design defines the blueprint
2. tasks define the work packages
3. implementation executes one approved task in code

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
system-structure-design -> review and approve design -> system-structure-tasks -> approve tasks -> system-structure-implementation
```

### Step 1: produce the design

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

### Step 2: review and approve the design

Do not rush into tasks.

The design should be strong enough that another model can answer without guessing:

- what the system owns
- what each module owns
- what each internal unit owns
- where new logic should go
- where new logic must not go
- which files implement which structural units

### Step 3: derive implementation tasks

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

### Step 4: implement one task at a time

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

### Install all skills with skills CLI

```bash
npx skills add ohwiki/system-structure-skills -g --all
```

### Install one skill only

```bash
npx skills add ohwiki/system-structure-skills -g --skill system-structure-design
npx skills add ohwiki/system-structure-skills -g --skill system-structure-tasks
npx skills add ohwiki/system-structure-skills -g --skill system-structure-implementation
```

### List available skills

```bash
npx skills add ohwiki/system-structure-skills -l
```

### Install by cloning

```bash
git clone https://github.com/ohwiki/system-structure-skills.git ~/.claude/plugins/system-structure-skills
```

Then copy or link the contents under `skills/` into your agent's skills directory if your environment does not support direct repository loading.

## Repository structure

```text
system-structure-skills/
├── README.md
├── .gitignore
├── scripts/
│   └── install.sh
└── skills/
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

## Design philosophy

These skills are built around a few hard ideas:

- high-level design and detailed design are different stages
- both stages must define what they do and what they do not do
- detailed design must connect structure to files
- tasks must inherit design rather than silently rewriting it
- implementation must inherit both design and tasks rather than reshaping the system during coding
- diagrams help, but structure and file landing points matter more than diagrams

## License

MIT
