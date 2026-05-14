# 02 Design

## Prompt

```text
Use $system-structure-design to produce both a high-level design and a detailed design before implementation.
The high-level design must clearly define what it decides and what it leaves to detailed design.
The detailed design must clearly define what it decides and what it leaves to implementation.
Base it on the approved CLI config requirements.
```

## Example output shape

### High-level design
- System boundary: existing CLI application and local config file loading path
- Technology direction: reuse the current CLI parser and add a config-loading path before command execution
- Top-level modules:
  - CLI command entry layer
  - config loading and parsing layer
  - option resolution layer
  - command execution layer
- External boundaries:
  - local filesystem for config lookup
  - existing stdout/stderr exit behavior
- High-level design decides precedence direction:
  - explicit CLI flags override config values
  - config values override built-in defaults
- High-level design does not yet decide every helper or file split

### Detailed design
- Internal units:
  - `ConfigLocator`
  - `ConfigParser`
  - `OptionResolver`
  - existing command handlers
- Dependency rules:
  - command handlers must consume resolved options rather than parse config directly
  - filesystem access belongs to config-loading units only
  - generic utility modules must not absorb precedence business rules
- File mapping:
  - `src/config/config-locator.*`
  - `src/config/config-parser.*`
  - `src/config/option-resolver.*`
  - updates in CLI entry / command dispatch files
- Critical flow:
  - process argv -> locate config -> parse config -> merge with defaults -> override with explicit CLI flags -> execute command
```
