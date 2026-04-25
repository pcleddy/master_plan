# STATUS

## Current State

Repository bootstrap and the practical First Sprint are complete. The project now has a working Lean 4 + Mathlib workspace, a stable initial source-tree shape, a first reusable theorem layer around pure states, phase-equivalence, bounded operators, bounded observables, expectation values, unitary operators, and qubit examples, and the Phase 1 bounded-operator spectrum API probe has started.

## 10k View

- Master roadmap in [LEAN_PHYSICS_MASTER_PLAN.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LEAN_PHYSICS_MASTER_PLAN.md)
- Lean 4 + Mathlib project at repository root
- Initial module tree for Hilbert basics, bounded operators, states, observables, and a qubit example
- First import-thinning pass complete: `LeanPhysics.Basic` no longer imports all of `Mathlib`
- First spectrum-facing module added for bounded-operator spectrum/resolvent probes
- `STATUS.md` as the current-state dashboard
- `milestones/` for major findings and structural decisions
- Phase 1 audit start recorded in [milestones/2026-04-25-phase1-dependency-audit-start.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/milestones/2026-04-25-phase1-dependency-audit-start.md)

## Active Work

Current theorem inventory is intentionally small and focused on the bounded-operator side of the plan. The active next stage is a Phase 1 dependency audit and selective theorem growth, not immediate spectral-theorem-scale work.

- `Foundations/HilbertBasic`: pure-state predicate and basic norm consequences
- `Foundations/Operators`: basic bounded-operator evaluation and composition lemmas
- `Foundations/Spectrum`: first Mathlib spectrum/resolvent API bridge for bounded operators
- `Foundations/Unitary`: stage-one unitary subgroup wrapper with identity, composition, norm-preservation, and inner-product-preservation lemmas
- `Quantum/States`: phase-equivalence scaffolding and pure-state invariance under unit-norm scalars
- `Quantum/Observables`: stage-one bounded observable wrapper, first expectation-value definition, expectation reality lemmas for observables, and closure under `0`, `+`, `-`, real scalar multiplication, conjugation, and the Gram operator construction `A†A`
- `Quantum/Examples/Qubit`: finite-dimensional sanity examples on `EuclideanSpace Complex (Fin 2)`, including identity and Pauli-Z style observables

## Counts

- Lean modules: 8 library files plus root/exe files
- Last verified build size: 3324 jobs
- Proven lemmas/theorems: 44 across the current foundation layer
- Open research machinery implemented: 0
  This is deliberate. The project is still avoiding spectral theorem, unbounded operators, RG flow, and spectral geometry until the base layer is less fragile.

## Current Focus

1. Extend the first compiling spectrum-API probe toward self-adjoint and point-spectrum checks
2. Keep abstractions thin and Mathlib-native
3. Delay heavy targets such as the full spectral theorem, unbounded operators, RG flow, and heat-kernel asymptotics until the dependency audit identifies a viable path

## Immediate Next Actions

1. Check Mathlib support for self-adjoint operators having real spectrum or spectrum restrictions
2. Decide whether point spectrum should be approached through `LinearMap` eigenspaces before Banach-algebra spectrum
3. Decide whether the next expectation-value layer should add positivity/projector lemmas or stay example-driven
4. Continue import thinning only when a specific module has an obvious broad dependency

## Risks

- Mathlib API discovery may force naming/layout changes early
- It is easy to over-model too soon and create wrappers around machinery Mathlib already has
- Unbounded operators and spectral-measure formalization are likely the first serious complexity wall
