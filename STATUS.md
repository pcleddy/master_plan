# STATUS

## Current State

Repository bootstrap and the practical First Sprint are complete. The project now has a working Lean 4 + Mathlib workspace, a stable initial source-tree shape, a first reusable theorem layer around pure states, phase-equivalence, bounded operators, bounded observables, expectation values, unitary operators, and qubit examples, and the Phase 1 dependency audit has started.

## 10k View

- Master roadmap in [LEAN_PHYSICS_MASTER_PLAN.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LEAN_PHYSICS_MASTER_PLAN.md)
- Lean 4 + Mathlib project at repository root
- Initial module tree for Hilbert basics, bounded operators, states, observables, and a qubit example
- First import-thinning pass complete: `LeanPhysics.Basic` no longer imports all of `Mathlib`
- `STATUS.md` as the current-state dashboard
- `milestones/` for major findings and structural decisions
- Phase 1 audit start recorded in [milestones/2026-04-25-phase1-dependency-audit-start.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/milestones/2026-04-25-phase1-dependency-audit-start.md)

## Active Work

Current theorem inventory is intentionally small and focused on the bounded-operator side of the plan. The active next stage is a Phase 1 dependency audit and selective theorem growth, not immediate spectral-theorem-scale work.

- `Foundations/HilbertBasic`: pure-state predicate and basic norm consequences
- `Foundations/Operators`: basic bounded-operator evaluation and composition lemmas
- `Foundations/Unitary`: stage-one unitary subgroup wrapper with identity, composition, norm-preservation, and inner-product-preservation lemmas
- `Quantum/States`: phase-equivalence scaffolding and pure-state invariance under unit-norm scalars
- `Quantum/Observables`: stage-one bounded observable wrapper, first expectation-value definition, expectation reality lemmas for observables, and closure under `0`, `+`, `-`, real scalar multiplication, conjugation, and the Gram operator construction `A†A`
- `Quantum/Examples/Qubit`: finite-dimensional sanity examples on `EuclideanSpace Complex (Fin 2)`, including identity and Pauli-Z style observables

## Counts

- Lean modules: 7 library files plus root/exe files
- Last verified build size: 3314 jobs
- Proven lemmas/theorems: 41 across the current foundation layer
- Open research machinery implemented: 0
  This is deliberate. The project is still avoiding spectral theorem, unbounded operators, RG flow, and spectral geometry until the base layer is less fragile.

## Current Focus

1. Turn the Phase 1 dependency audit into a small compiling spectrum-API probe
2. Keep abstractions thin and Mathlib-native
3. Delay heavy targets such as the full spectral theorem, unbounded operators, RG flow, and heat-kernel asymptotics until the dependency audit identifies a viable path

## Immediate Next Actions

1. Add a small Lean probe for Mathlib's `spectrum`, `resolventSet`, and `resolvent` APIs on `BoundedOperator`
2. Check whether `H ->L[𝕜] H` has all normed-algebra instances needed for the spectrum API without extra local wrappers
3. Decide whether the next expectation-value layer should add positivity/projector lemmas or stay example-driven
4. Continue import thinning only when a specific module has an obvious broad dependency

## Risks

- Mathlib API discovery may force naming/layout changes early
- It is easy to over-model too soon and create wrappers around machinery Mathlib already has
- Unbounded operators and spectral-measure formalization are likely the first serious complexity wall
