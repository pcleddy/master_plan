# WAKE_UP

## Where The Repo Stands

- The repository builds with `lake build`
- Current library entry point is [LeanPhysics.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics.lean)
- The practical bootstrap / First Sprint is complete
- `First Sprint` is currently estimated at `100%` complete
- Whole master plan completion estimate is `21%`
- Last verified build size: `3314` jobs
- Phase 1.1 and Phase 1.2 are now marked in progress because the dependency audit has started

## What Landed Most Recently

- Added [LeanPhysics/Foundations/Unitary.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Foundations/Unitary.lean)
- It reuses Mathlib's `unitary (H →L[𝕜] H)` subgroup rather than introducing a custom unitary structure
- Current unitary layer exposes:
  - identity/unit element
  - `ContinuousLinearMap.id` as unitary
  - closure under composition
  - norm preservation
  - inner-product preservation
- `Quantum/Observables` now also proves the first observable-specific expectation reality result:
  expectation values of observables are fixed by `star`, and over `Complex` they have zero imaginary part
- `Quantum/Examples/Qubit` now includes a nontrivial finite-dimensional observable:
  a Pauli-Z-style operator built from a Hermitian `2 × 2` matrix, together with observable and expectation lemmas
- First import-thinning pass is complete:
  [LeanPhysics/Basic.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Basic.lean) imports the specific inner-product/adjoint and tactic modules needed by the bootstrap layer instead of all of `Mathlib`
- [Main.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/Main.lean) no longer repeats the root `LeanPhysics` import
- First Sprint completion and Mathlib API findings are recorded in:
  [milestones/2026-04-25-first-sprint-complete.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/milestones/2026-04-25-first-sprint-complete.md)
- Phase 1 dependency audit start is recorded in:
  [milestones/2026-04-25-phase1-dependency-audit-start.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/milestones/2026-04-25-phase1-dependency-audit-start.md)
- Tracking docs updated:
  - [STATUS.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/STATUS.md)
  - [progress.md](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/progress.md)

## Current Module Inventory

- [LeanPhysics/Foundations/HilbertBasic.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Foundations/HilbertBasic.lean)
- [LeanPhysics/Foundations/Operators.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Foundations/Operators.lean)
- [LeanPhysics/Foundations/Unitary.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Foundations/Unitary.lean)
- [LeanPhysics/Quantum/States.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Quantum/States.lean)
- [LeanPhysics/Quantum/Observables.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Quantum/Observables.lean)
- [LeanPhysics/Quantum/Examples/Qubit.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Quantum/Examples/Qubit.lean)

## Best Next Steps

1. Add a small compiling Lean probe for Mathlib's spectrum API on `BoundedOperator`.
2. Check `spectrum 𝕜 A`, `resolventSet 𝕜 A`, and `resolvent A z` against `H ->L[𝕜] H` before creating any local `Spectrum` abstraction.
3. Decide whether the next expectation-value increment should be positivity/projector lemmas or more concrete examples.

## Notes For The Next Iteration

- Prefer thin wrappers over project-local abstractions if Mathlib already has the notion.
- For unitary operators, the right Mathlib API lives in:
  `Mathlib/Analysis/InnerProductSpace/Adjoint.lean`
- Useful theorems already confirmed in Mathlib:
  - `ContinuousLinearMap.norm_map_of_mem_unitary`
  - `ContinuousLinearMap.inner_map_map_of_mem_unitary`
  - `Unitary.star_mul_self_of_mem`
  - `Unitary.mul_star_self_of_mem`
- The qubit example currently uses `EuclideanSpace Complex (Fin 2)`, not a plain function alias.
- The “expectation is real” step is now done.
- The Pauli-Z-style example is now done, and the matrix-backed route worked.
- The clean pattern is:
  define a `2 × 2` Hermitian matrix,
  use `Matrix.toEuclideanLin.toContinuousLinearMap`,
  prove observability via `Matrix.isSymmetric_toEuclideanLin_iff` and `LinearMap.IsSymmetric.isSelfAdjoint`.
- Phase 1 audit decision so far:
  keep using `[NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]`, `ContinuousLinearMap`, `IsSelfAdjoint`, and `unitary (H ->L[𝕜] H)` directly until a theorem forces a bundled local abstraction.
- First Sprint should be treated as closed. Do not keep expanding bootstrap scope unless a small cleanup directly supports the Phase 1 audit.
