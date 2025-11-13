# File design and build template

> Use this template to design, implement, and debug a single file in a larger program. Keep it living and auditable.

---

## Context and purpose

- **Program name:**  
- **Program summary:**  
- **File name and path:**  
- **File purpose (one-liner):**  
- **Primary responsibilities:**  
- **Non-goals:**  

---

## Scope and interfaces

#### Role within the program
- **Module/package:**  
- **Upstream inputs:**  
- **Downstream outputs:**  
- **Callers (who uses this):**  
- **Callees (what this uses):**  
- **Side effects (IO, state):**  

#### Public API of this file
- **Exports (functions/classes/types):**  
- **Visibility (public/internal):**  
- **Contracts (pre/postconditions):**  
- **Error model (exceptions/returns):**  

---

## Data, configuration, and dependencies

#### Data structures and types
- **Core types:**  
- **Schemas/versions:**  
- **Serialization format:**  

#### Configuration
- **Config keys (with defaults):**  
- **Source (env, file, flags):**  
- **Validation rules:**  

#### Dependencies
- **Libraries and versions:**  
- **System/runtime assumptions:**  
- **External services and auth:**  

> Note: capture exact versions and compatibility notes for reproducibility.

---

## Design plan and build steps

#### Design notes
- **Algorithm/approach:**  
- **Complexity considerations:**  
- **Threading/concurrency model:**  
- **Resource management (files, sockets, memory):**  

#### Implementation checklist
1. **Define types and interfaces**  
2. **Implement core logic**  
3. **Handle errors and retries**  
4. **Add logging and metrics**  
5. **Validate configuration**  
6. **Write unit tests**  
7. **Add integration tests/mocks**  
8. **Document public API**  
9. **Run static analysis/formatters**  
10. **Update changelog/version**

#### Pseudocode or outline
```text
# High-level flow
init()
  load_config()
  validate()
  setup_dependencies()

execute()
  process_input()
  transform()
  output_results()

teardown()
  close_resources()
  emit_metrics()
```

---

## Inputs, outputs, and contracts

- **Inputs (shape, example):**  
- **Outputs (shape, example):**  
- **Invariants (must always hold):**  
- **Edge cases:**  
- **Time/space constraints:**  

```json
// Example input
{
  "..."
}
```

```json
// Example output
{
  "..."
}
```

---

## Testing and validation

#### Unit tests
- **Coverage targets:**  
- **Key cases:**  
- **Fixtures/mocks:**  

#### Integration tests
- **Environment/setup:**  
- **Interfaces exercised:**  
- **Failure scenarios:**  

#### Acceptance criteria
- **Functional checks:**  
- **Performance thresholds:**  
- **Observability (logs/metrics):**  

```text
Test matrix
- Case A: ...
- Case B: ...
```

---

## Observability, performance, and safety

- **Logging (levels, messages):**  
- **Metrics (counters, timers):**  
- **Tracing (spans/attributes):**  
- **Rate limits/backoff:**  
- **Idempotency and retry semantics:**  
- **Crash-safety (atomic writes, fsync):**  
- **Data integrity (checksums/CRC):**  

---

## Debug log and issues

#### Active debug notes
- **Symptoms:**  
- **Hypotheses:**  
- **Experiments and results:**  
- **Current status:**  

```text
[YYYY-MM-DD HH:MM] Observation:
[YYYY-MM-DD HH:MM] Change:
[YYYY-MM-DD HH:MM] Result:
```

#### Known issues and mitigation
- **Issue:**  
- **Impact:**  
- **Workaround:**  
- **Fix plan:**  

---

## Code snippets and examples

```lang
// Minimal usage example
```

```lang
// Core function stub
```

```lang
// Edge-case handling
```

> Tip: keep snippets runnable and versioned with the file.

---

## Decisions, risks, and audit trail

- **Key decisions (with rationale):**  
- **Alternatives considered:**  
- **Risks and mitigations:**  
- **Security/privacy notes:**  
- **Compliance or policy constraints:**  

```text
Decision log
- [YYYY-MM-DD] Chose X over Y because ...
```

---

## Tasks and changes

#### TODOs
- **Immediate next steps:**  
- **Blocked by:**  
- **Dependencies to update:**  

#### Changelog (per file)
- **Version:**  
- **Date:**  
- **Change summary:**  
- **Author:**  

---

## References and notes

- **Related files/modules:**  
- **Specs/tickets/links:**  
- **Glossary:**  
- **Open questions:**  
> Keep this section lean but complete enough to onboard a future reader quickly.