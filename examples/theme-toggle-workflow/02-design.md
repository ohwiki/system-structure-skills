# 02 Design

## Prompt

```text
Use $system-structure-design to produce both a high-level design and a detailed design before implementation.
The high-level design must clearly define what it decides and what it leaves to detailed design.
The detailed design must clearly define what it decides and what it leaves to implementation.
Base it on the approved theme-toggle requirements.
```

## Example output shape

### High-level design
- System boundary: client-side web application theme behavior
- Technology choice: reuse existing frontend framework and styling approach
- Top-level modules:
  - Theme UI entrypoint
  - Theme application service
  - Theme persistence adapter
- External boundary:
  - Browser localStorage for persisted preference
- High-level design does not decide exact helper layout or every internal file yet

### Detailed design
- Internal units:
  - `ThemeToggleControl`
  - `ThemeService`
  - `ThemeStorage`
  - optional `ThemeProvider` or existing state hook integration
- Dependency rules:
  - UI control may call theme service only
  - storage access must go through persistence adapter
  - generic helpers must not absorb theme business rules
- File mapping:
  - `src/components/theme-toggle.*`
  - `src/services/theme-service.*`
  - `src/adapters/theme-storage.*`
- Critical flow:
  - app startup -> read persisted theme -> apply theme -> render UI
  - user toggle -> update theme state -> persist selection -> rerender
```
