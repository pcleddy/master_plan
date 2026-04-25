# Progress

## Purpose

This file is the 10k tracking view for [LEAN_PHYSICS_MASTER_PLAN.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LEAN_PHYSICS_MASTER_PLAN.md). It separates work that is already landed in the repository from work that remains on the roadmap.

Update this file as you complete problems. Use the status indicators below.

**Status indicators**:
- 🟡 **Not started** — Listed but no work yet
- 🟠 **In progress** — Actively working on it
- 🟢 **Complete** — Proof done, compiles, no `sorry`
- ⚠️ **Outline done** — Statements and proof structure, some `sorry` remaining
- ❌ **Blocked** — Issue preventing progress (document below)

## Snapshot

- Current stage: Phase 1 dependency audit for Hilbert-space and bounded-operator expansion
- Build status: `lake build` is green
- Current code focus: Mathlib-native Hilbert-space/operator APIs, spectrum API probing, and keeping local wrappers thin
- First Sprint completion estimate: `100%`
- Whole master plan completion estimate: `21%`
- Last verified build size: `3314` jobs after the first import-thinning pass
- Heavy downstream targets such as the spectral theorem, RG flow, and spectral geometry are still intentionally deferred

## Stage Tracker

- 🟢 `Bootstrap / First Repository Shape` — `8%` of entire project
- 🟢 `First Sprint: bounded operators, states, observables, qubit sanity checks` — `12%` of entire project
- 🟠 `Phase 1.1 Hilbert space formalism expansion` — `9%` of entire project
- 🟠 `Phase 1.2 Bounded operators and spectrum` — `11%` of entire project
- 🟡 `Phase 1.3 Spectral theorem core` — `11%` of entire project
- 🟡 `Phase 1.4 Compact operators and trace class` — `7%` of entire project
- 🟡 `Phase 1.5 Lie groups and Lie algebras` — `5%` of entire project
- 🟡 `Phase 1.6 Integration and measure theory support` — `5%` of entire project
- 🟡 `Quantum-mechanical core beyond bootstrap` — `7%` of entire project
- 🟡 `Renormalization group formalization` — `9%` of entire project
- 🟡 `Noncommutative spectral geometry` — `9%` of entire project
- 🟡 `Standard Model emergence / fixed-point program` — `7%` of entire project

These percentages are planning weights, not theorem counts. They are meant to show how much of the total roadmap each stage represents at a 10k level, and the stage weights sum to `100%`.

## Done

### 🟢 Bootstrap / First Repository Shape (`8%`)

- Lean 4 project initialized with Mathlib and a working root build
- Core namespace and module layout established
- Status and milestone tracking files added

### 🟢 First Sprint: Bounded Operator Kernel (`12%`)

- `Foundations/HilbertBasic` added for pure-state basics
- `Foundations/Operators` added for bounded-operator aliases and first evaluation/composition lemmas
- `Foundations/Unitary` added for the first unitary subgroup interface, including identity, composition, norm preservation, and inner-product preservation
- `Quantum/States` added for phase-equivalence and unit-norm scalar invariance
- `Quantum/Observables` added for bounded self-adjoint observables

### First Theorem Batch

- Initial reusable theorem inventory is in place
- Observable closure under `0`, `+`, `-`, and real scalar multiplication is proved
- Observable conjugation and Gram-operator observability (`A†A`) are proved
- A first expectation-value definition exists, with algebraic lemmas for `0`, `+`, and scalar multiplication
- Expectation values of observables are now proved to be fixed by `star`, with a complex corollary `im = 0`

### Finite-Dimensional Sanity Check

- `Quantum/Examples/Qubit` exists
- The qubit example now uses `EuclideanSpace Complex (Fin 2)` as the concrete finite-dimensional Hilbert model
- The identity operator and its Gram operator are checked in that example
- A Pauli-Z-style qubit observable is now defined from a Hermitian `2 × 2` matrix
- The Pauli-Z example is proved observable, fixes `|0⟩`, and has expectation value `1` on `|0⟩`

### Documentation / Tracking

- `STATUS.md` reflects current repository state
- Milestones for bootstrap, bounded observables, and First Sprint completion are recorded under `milestones/`

### Import Hygiene

- `LeanPhysics.Basic` now imports the specific inner-product/adjoint and tactic surface needed by the bootstrap layer instead of all of `Mathlib`
- `Main.lean` no longer repeats the root `LeanPhysics` import
- `lake build` is verified after the cleanup

### API Audit Notes

- First Mathlib API findings are recorded in `milestones/2026-04-25-first-sprint-complete.md`
- The sprint ended with aliases and predicates where Mathlib already has the right structure: `ContinuousLinearMap`, `IsSelfAdjoint`, and `unitary`
- The Phase 1 dependency audit has started in `milestones/2026-04-25-phase1-dependency-audit-start.md`

## To Do

### 🟢 Complete The First Sprint Properly (`12%`)

- Complete. Continue import thinning only where a module has an obvious broad dependency.

### 🟠 Continue Phase 1 Dependency Audit

### 🟠 Phase 1.1 Hilbert Space Formalism Expansion (`9%`)

- Audit has started; current decision is to keep using Mathlib's typeclass stack directly instead of adding a custom `HilbertSpace` wrapper
- Expand Hilbert-space infrastructure beyond the current minimal layer
- Add more explicit reusable results around completeness, orthonormality, direct sums, and tensor-product prerequisites
- Decide how much of the master plan's custom `HilbertSpace` wrapper is actually warranted versus staying Mathlib-native

### 🟠 Phase 1.2 Bounded Operators And Spectrum (`11%`)

- Audit has started; next concrete step is a small compiling probe against Mathlib's `spectrum`, `resolventSet`, and `resolvent` APIs for `BoundedOperator`
- Build a fuller bounded-operator and spectrum layer
- Add operator norm and spectral-facing results beyond the current closure lemmas
- Audit and then formalize the spectral theorem dependencies instead of just bounded observable closure

### 🟡 Phase 1.3 Spectral Theorem Core (`12%`)

- Formalize the PVM and functional-calculus prerequisites
- Determine the exact Mathlib gap for the bounded self-adjoint spectral theorem
- Move from dependency audit to theorem statements and then proofs

### 🟡 Phase 1.4 Compact Operators And Trace Class (`8%`)

- Decide what compact-operator and trace-class work is realistic against Mathlib support
- Add compact self-adjoint operator infrastructure if the dependency layer is strong enough
- Formalize trace and trace-class only after the operator layer is stable

### 🟡 Phase 1.5 Lie Groups And Lie Algebras (`6%`)

- Start only when later physics phases genuinely need it
- Reuse Mathlib structures instead of introducing local wrappers prematurely

### 🟡 Phase 1.6 Integration And Measure Theory Support (`6%`)

- Pull in only the `L²` and integration machinery required by operator and spectral work
- Avoid broad measure-theory expansion until a concrete downstream proof needs it

### 🟡 Quantum-Mechanical Core Beyond Bootstrap (`8%`)

- Move from pure states only toward density-operator interfaces if needed
- Extend observables from algebraic closure facts to measurement-facing theorems
- Add richer qubit and finite-dimensional examples, likely including Pauli-style operators or equivalent matrix models

### 🟡 Renormalization Group Formalization (`10%`)

- Formalize RG dynamics only after the operator and analysis layers are strong enough
- Separate structural mathematics from any physics-motivated interpretation layer

### 🟡 Noncommutative Spectral Geometry (`10%`)

- Build only after operator, spectral, and trace machinery is mature
- Expect this phase to depend on multiple earlier layers being substantially complete

### 🟡 Standard Model Emergence / Fixed-Point Program (`8%`)

- Investigate only after the foundational mathematics is formalized enough to support it
- Treat impossibility or obstruction results as valid endpoints if the mathematics forces them

## Practical Read

- If the question is “what is done?”, the answer is: the repository has crossed from bootstrap into a small but real bounded-operator formalization with reusable lemmas and one worked finite-dimensional example.
- If the question is “what is still to do?”, the answer is: almost all of the deep mathematics in the master plan remains ahead, and the next serious step is to turn the Phase 1 dependency audit into a compiling spectrum-API probe before attempting spectral-theorem-scale work.
