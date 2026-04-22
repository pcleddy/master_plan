# WAKE_UP

## Where The Repo Stands

- The repository builds with `lake build`
- Current library entry point is [LeanPhysics.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics.lean)
- The project is still in the bounded-operator bootstrap phase of the master plan
- `First Sprint` is currently estimated at about `75%` complete

## What Landed Most Recently

- Added [LeanPhysics/Foundations/Unitary.lean](/Users/pleddy/docs/cloudautomat/code/projects/master_plan/LeanPhysics/Foundations/Unitary.lean)
- It reuses Mathlib's `unitary (H →L[𝕜] H)` subgroup rather than introducing a custom unitary structure
- Current unitary layer exposes:
  - identity/unit element
  - `ContinuousLinearMap.id` as unitary
  - closure under composition
  - norm preservation
  - inner-product preservation
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

1. Prove the first expectation theorem specific to observables:
   expectation value of a self-adjoint bounded observable is real.
2. Add one nontrivial finite-dimensional operator example:
   Pauli-style operator or equivalent concrete qubit observable.
3. Only after that, spend time on import thinning or broader dependency audit cleanup.

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
- If the next step is the “expectation is real” theorem, expect some API search around `RCLike.re`, `conj`, `IsSelfAdjoint`, and `adjoint_inner_left/right`.
