---
name: system-structure-design
description: Define how a software system should be designed and structured before implementation, using a two-stage process of high-level design and detailed design. Use when Codex needs to decide framework, technology choices, system boundaries, major modules, integration calls, internal unit structure, dependency rules, and concrete file mappings so implementation does not drift. Trigger for requests about architecture design, high-level design, low-level design, system structure, module decomposition, file layout, implementation guardrails, or pre-coding design blueprints.
---

# System Structure Design

## Overview

Use this skill to create a buildable system blueprint for an LLM before coding starts. The goal is not to draw diagrams for their own sake. The goal is to make the model understand what the system does, how it is divided, what each part owns, how those parts relate, and where they land in files so implementation stays in shape.

## Core principle

Treat the design like a construction drawing for software.
The design must move in two stages:
- high-level design: decide the system frame
- detailed design: decide how the frame lands in internal structure and files

If the design jumps straight into files without choosing the frame first, it is incomplete.

## Design stages

### Stage 1: High-level design

Use this stage to define the system frame.

This stage does:
- define what the system or feature must do
- define what it must not do
- define the system boundary and external context
- define project type: extend existing system or build new structure
- define framework, runtime, platform, or stack choices when they shape the design
- define external systems, APIs, stores, queues, or tools involved
- define top-level modules or services and their major responsibilities
- define top-level interaction and call boundaries
- define the major architectural style or direction when relevant
- define major constraints that detailed design must respect

This stage does not:
- decide every internal unit inside each module
- decide helper-level code structure
- decide exact file-by-file implementation layout
- specify code-level implementation tricks
- replace detailed design

If system boundary, top-level modules, or major technology constraints are still unclear, do not proceed to detailed design.

### Stage 2: Detailed design

Use this stage only after the high-level design is stable enough.

This stage does:
- define the internal unit breakdown of important modules
- define responsibility split inside each module
- define what each internal unit does and does not do
- define allowed and forbidden dependencies
- define public versus private internal interfaces
- define critical runtime flows where placement matters
- define where validation, state changes, and side effects belong
- define concrete file and directory mapping
- define implementation guardrails that prevent structural drift

This stage does not:
- choose arbitrary code-level details that do not affect structure
- expand into line-by-line implementation
- turn every private helper into design material
- replace coding, testing, or local refactoring decisions
- contradict the high-level design frame

If detailed design cannot tell another model where logic belongs and where it must not be added, it is incomplete.

## Workflow

Follow these steps in order.

### 1. Define the system job

Write down:
- what the system or feature must do
- what it must not do
- who uses it or what triggers it
- what outcomes it must produce

### 2. Produce the high-level design

Write the high-level design first.
Include:
- system purpose and non-goals
- project context and constraints
- framework or technology choices when relevant
- external dependencies and integration boundaries
- top-level modules and their responsibilities
- top-level call or interaction paths
- major architectural decisions and rejected alternatives

If the request is for an existing codebase, also explain why the chosen integration points fit the current system.

### 3. Decide the structure levels for detailed design

Do not force one vocabulary. The structure may be:
- system -> modules -> components -> files
- system -> modules -> submodules -> files
- system -> services -> adapters -> files
- system -> domains -> workflows -> files

Choose the smallest set of levels that matches the actual design.
State the chosen structure explicitly.

### 4. Produce the detailed design

For each important module, define:
- internal units
- unit responsibilities and non-responsibilities
- inputs and outputs
- callers and downstream dependencies
- public or private status
- dependency rules
- runtime placement of validation, side effects, and state changes
- file and directory mapping

### 5. Record decisions and guardrails

Capture short ADR-style records for major choices:
- decision
- context
- alternative rejected
- why this choice won
- consequence for implementation

List the main risks and the rules that keep implementation from drifting.

## Required output structure

Unless the user explicitly narrows the task, produce these sections:
1. System purpose
2. Scope and non-goals
3. High-level design
4. High-level design boundaries
5. Technology and framework choices
6. External systems and call boundaries
7. Top-level modules and ownership
8. Chosen structure levels for detailed design
9. Detailed design responsibilities and non-responsibilities
10. Detailed internal unit breakdown
11. Boundary and dependency rules
12. File and directory mapping
13. Critical flows
14. Design decisions
15. Risks and implementation guardrails

## Diagrams

Diagrams are optional support, not the design itself.
Use Mermaid only when it helps readers understand the structure faster.

Prefer these diagrams when useful:
- system or module map for high-level design
- key module internal structure map for detailed design
- sequence diagram for one critical flow

If the same meaning is already clearer in a table, keep the table and skip the diagram.

## Definition of done

The design is not done unless another model can answer all of these without guessing:
- What is the system or feature responsible for?
- What high-level architecture frame was chosen?
- What does the high-level design explicitly leave out for detailed design?
- What framework or technology constraints matter?
- What are the top-level modules?
- What does each module own and not own?
- What internal units exist inside the important modules?
- What does each internal unit do and not do?
- Who may depend on whom?
- What dependencies are forbidden?
- Which files implement which units?
- Which files are entrypoints and which are private details?
- Where should new logic be added, and where must it not be added?

If those answers are not obvious, revise before implementation.

## Output style

Use concise engineering prose.
Use tables for ownership, dependency rules, and file mapping.
Use Mermaid only when it clarifies structure.
Do not produce vague layer talk without file landing points.

## References

Load [references/system-blueprint-template.md](references/system-blueprint-template.md) when drafting the design output.
Load [references/diagram-guidance.md](references/diagram-guidance.md) when Mermaid examples are needed.
Load [references/review-gate.md](references/review-gate.md) to self-check whether the blueprint is strong enough to guide implementation.
