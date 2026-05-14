# System Blueprint Template

Use this template when the goal is to tell an implementation model how the system should be shaped before code is written.
Use a two-stage design: high-level design first, detailed design second.

## 1. System Purpose

State:
- what the system or feature is for
- who uses it or what triggers it
- what outcomes it must produce

## 2. Scope and Non-Goals

List what is in scope.
List what is explicitly out of scope.

## 3. High-Level Design

Define the system frame before internal decomposition.

This section must do:
- define the system boundary
- define the top-level problem framing
- define the major modules or services
- define major integration points
- define architecture direction and major constraints

This section must not do:
- file-by-file layout
- helper-level decomposition
- code-level implementation detail

Questions to answer:
- What is the system boundary?
- What sits outside the boundary?
- What top-level parts are needed?
- Why is this frame appropriate for the requirement?

## 4. High-Level Design Boundaries

Make the stage boundary explicit.

Recommended table columns:
- Item
- High-level design decides
- High-level design does not decide yet
- Why deferred

## 5. Technology and Framework Choices

State the framework, runtime, platform, or stack choices that affect the shape of the system.

Recommended table columns:
- Area
- Choice
- Why chosen
- Constraint introduced
- Rejected alternative

## 6. External Systems and Call Boundaries

Define external APIs, storage systems, queues, filesystems, services, or tools the system interacts with.

Recommended table columns:
- External system
- Interaction type
- Direction
- Main contract
- Failure sensitivity
- Boundary rule

## 7. Top-Level Modules and Ownership

For each top-level module, define:
- purpose
- owns what behavior
- owns what state or data
- exposes what interface
- must not own what responsibilities

Recommended table columns:
- Module
- Purpose
- Owns
- Exposes
- Must not own
- Depends on

## 8. Chosen Structure Levels for Detailed Design

State the structure used for the detailed design.
Examples:
- system -> modules -> components -> files
- system -> modules -> services -> files
- system -> domains -> workflows -> files

Explain why this structure fits better than alternative decompositions.

## 9. Detailed Design Responsibilities and Non-Responsibilities

Make the stage boundary explicit.

This section must do:
- define internal unit split
- define dependency rules
- define file landing points
- define where important behavior belongs

This section must not do:
- line-by-line coding
- helper-level noise that does not affect structure
- implementation detail that can be safely decided locally during coding

Recommended table columns:
- Item
- Detailed design decides
- Detailed design does not decide
- Why left to implementation

## 10. Detailed Internal Unit Breakdown

For each important module, define internal units.
These may be components, submodules, services, adapters, workflows, repositories, controllers, parsers, or policies.

Recommended table columns:
- Parent module
- Unit
- Type
- Responsibility
- Not responsible for
- Inputs
- Outputs
- Called by
- Depends on
- Visibility

## 11. Boundary and Dependency Rules

Write direct constraints.
Examples:
- CLI command handlers may call application services only
- Domain policies must not import storage adapters
- Repositories implement storage only and must not contain business rules
- Shared helpers must not become a dumping ground for core logic

Recommended table columns:
- Rule ID
- Allowed dependency or boundary
- Forbidden dependency or boundary
- Why it exists

## 12. File and Directory Mapping

Map the structure to real files.
This is required.

Recommended table columns:
- Path
- Type
- Belongs to module
- Belongs to unit
- Purpose
- Public or private
- Must not contain

## 13. Critical Flows

Describe the flows that are most likely to drift during implementation.
Only include flows that help keep responsibilities in the right place.

For each flow, include:
- trigger
- major steps
- where validation happens
- where state changes happen
- where side effects happen
- failure or fallback path

## 14. Design Decisions

Capture short ADR-style records.

Template:
- Decision:
- Context:
- Rejected alternative:
- Why chosen:
- Consequence:

## 15. Risks and Implementation Guardrails

List the ways implementation could go wrong.
Examples:
- logic placed in the wrong layer
- dependency rule broken for convenience
- one file absorbing unrelated responsibilities
- state mutation mixed with parsing or validation
- technology choice bypassed during implementation

Recommended table columns:
- Risk
- Likely failure mode
- Prevention rule
- Validation method

## Optional diagrams

Add Mermaid only when it makes the structure easier to understand.
Useful diagram types:
- high-level system or module map
- key module internal structure map
- sequence diagram for one critical flow

Do not substitute diagrams for ownership tables or file mapping.
