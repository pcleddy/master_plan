# STATUS

## Current State

Repository bootstrap and the practical First Sprint are complete. The project now has a working Lean 4 + Mathlib workspace, a stable initial source-tree shape, and a first reusable theorem layer around pure states, phase-equivalence, bounded operators, bounded observables, expectation values, unitary operators, and qubit examples.

## 10k View

- Master roadmap in [LEAN_PHYSICS_MASTER_PLAN.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LEAN_PHYSICS_MASTER_PLAN.md)
- Lean 4 + Mathlib project at repository root
- Initial module tree for Hilbert basics, bounded operators, states, observables, and a qubit example
- First import-thinning pass complete: `LeanPhysics.Basic` no longer imports all of `Mathlib`
- `STATUS.md` as the current-state dashboard
- `milestones/` for major findings and structural decisions

## Active Work

Current theorem inventory is intentionally small and focused on the bounded-operator side of the plan. The next stage should be a Phase 1 dependency audit and selective theorem growth, not immediate spectral-theorem-scale work.

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

1. Start the Phase 1 dependency audit from the bounded-operator foundation now in place
2. Keep abstractions thin and Mathlib-native
3. Delay heavy targets such as the full spectral theorem, unbounded operators, RG flow, and heat-kernel asymptotics until the dependency audit identifies a viable path

## Immediate Next Actions

1. Begin a written Mathlib dependency audit for Phase 1.1 and Phase 1.2
2. Decide whether the next expectation-value layer should add positivity/projector lemmas or stay example-driven
3. Choose whether the next finite-dimensional example should be Pauli-X / Pauli-Y or a projector/rank-one observable
4. Continue import thinning only when a specific module has an obvious broad dependency

## Risks

- Mathlib API discovery may force naming/layout changes early
- It is easy to over-model too soon and create wrappers around machinery Mathlib already has
- Unbounded operators and spectral-measure formalization are likely the first serious complexity wall
