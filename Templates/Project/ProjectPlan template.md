# Project design and delivery template

> Use this to drive an entire project from idea to operations. It orchestrates module/file templates without duplicating their content—link to each file’s template from the index sections.

---

## Project overview

- **Project name:**  
- **One-line mission:**  
- **Primary outcomes:**  
- **Non-goals:**  
- **Stakeholders and roles:**  
- **Success metrics:**  

> Keep this high-level. Detailed design lives in architecture and module/file templates.

---

## Architecture and system map

#### Context diagram
- **Bounded contexts:**  
- **External systems and protocols:**  
- **Trust boundaries and data flows:**  

#### Logical architecture
- **Services/modules:**  
- **Key responsibilities:**  
- **Contracts and interfaces:**  

#### Operational architecture
- **Environments (dev/test/stage/prod):**  
- **Runtime topology (containers, nodes):**  
- **Networking and security zones:**  

> Store detailed per-file API, error models, and side effects in the file templates; reference them here rather than duplicating.

---

## Module index and file links

> Single source of truth for where things live. Each entry links to the file-level template for deep details.

#### Modules
- **Module:**  
  - **Purpose:**  
  - **Owner:**  
  - **Repo/path:**  
  - **File template index link:**  
  - **Status:**  

#### Files (auto-generated or curated)
- **File:**  
  - **Path:**  
  - **Role:**  
  - **Last updated:**  
  - **Design/build/debug template link:**  

> Prefer generating this section from your repo to avoid drift. If manual, keep it lean and link-only.

---

## Requirements and scope

#### Business requirements
- **User stories (IDs):**  
- **Acceptance criteria:**  
- **KPIs impacted:**  

#### Technical requirements
- **Performance targets:**  
- **Reliability targets (SLOs):**  
- **Security/compliance constraints:**  
- **Data retention and integrity:**  

#### Out of scope
- **Explicit exclusions:**  
- **Deferred decisions:**  

> Implementation specifics per file belong in their file templates; reference story IDs to connect requirements to files.

---

## Delivery plan and lifecycle

#### Phases
1. **Inception:** Scope, stakeholders, risks
2. **Design:** Architecture, module boundaries
3. **Build:** File implementation using file templates
4. **Test:** Unit, integration, end-to-end
5. **Release:** Change management, rollout plan
6. **Operate:** Observability, SRE runbooks
7. **Evolve:** Schema/version evolution, migrations

#### Milestones
- **Milestone:**  
  - **Date:**  
  - **Deliverables:**  
  - **Dependencies:**  
  - **Risks:**  
  - **Go/no-go criteria:**  

#### Work breakdown structure
- **Epic/Feature:**  
  - **Stories:**  
  - **Linked files/modules:**  
  - **Definition of done:**  

---

## Quality gates and verification

#### Engineering checks
- **Static analysis/formatting:**  
- **Code review standards:**  
- **Security review:**  
- **Dependency policy (versions, licenses):**  

#### Testing strategy
- **Unit coverage threshold:**  
- **Integration scope:**  
- **E2E scenarios:**  
- **Performance/load plan:**  
- **Chaos/fault-injection plan:**  

#### Release readiness
- **Changelog completeness:**  
- **Backward compatibility:**  
- **Migration steps validated:**  
- **Rollback tested:**  

> File-level test cases, fixtures, and error models remain in each file template; link summaries here.

---

## Operations, observability, and safety

#### Runbooks
- **Startup/Shutdown procedures:**  
- **Scaling and failover:**  
- **Backup/restore:**  
- **Disaster recovery:**  

#### Observability
- **Log taxonomy:**  
- **Metrics (SLO alignment):**  
- **Tracing model:**  
- **Dashboards/alerts:**  

#### Safety and integrity
- **Atomicity and idempotency guarantees:**  
- **Retry/backoff policies:**  
- **Data integrity (checksums/CRC):**  
- **Incident response protocol:**  

> Reference specific log fields, metric names, and span attributes from the file templates; don’t copy them here.

---

## Governance and audit trail

#### Decision log
- **Decision:**  
  - **Date:**  
  - **Context:**  
  - **Options considered:**  
  - **Chosen path and rationale:**  
  - **Links to affected files/modules:**  

#### Risk register
- **Risk:**  
  - **Likelihood/Impact:**  
  - **Mitigation:**  
  - **Owner:**  
  - **Status:**  

#### Compliance
- **Data classification:**  
- **PII/PHI handling:**  
- **Policies and controls:**  
- **Evidence links:**  

> Keep decisions at project level; per-file decisions stay in the file template and are linked here.

---

## Roadmap and change management

#### Versioning strategy
- **Semantic versioning policy:**  
- **Schema evolution rules:**  
- **Deprecation policy:**  

#### Release planning
- **Release cadence:**  
- **Change approval process:**  
- **Feature flags and rollout:**  
- **Rollback/roll-forward criteria:**  

#### Migration plans
- **From version:**  
- **To version:**  
- **Steps:**  
- **Validation:**  
- **Impact analysis:**  
- **Linked files/modules:**  

---

## Documentation index and onboarding

#### Core docs
- **Architecture overview:**  
- **Security model:**  
- **Data model:**  
- **Ops runbooks:**  
- **Contribution guide:**  

#### File and module references
- **Index to file templates:**  
- **API catalog links:**  
- **Config catalog links:**  

#### Onboarding checklist
1. **Read architecture overview**  
2. **Set up dev environment**  
3. **Run smoke tests**  
4. **Pick a module and review file templates**  
5. **Implement or debug with the file template**  
6. **Open PR with quality gate checks**  

---

## Project status and notes

#### Current status
- **Phase:**  
- **Velocity:**  
- **Open risks:**  
- **Top blockers:**  
- **Recent changes:**  

#### Notes
- **Context updates:**  
- **Open questions:**  
- **Meeting outcomes:**  

> Use this section for living updates. Deep technical notes stay attached to the relevant file template and are linked from the module index.