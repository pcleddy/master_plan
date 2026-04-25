# First Sprint Complete

Date: 2026-04-25

## Finding

The practical bootstrap sprint is complete enough to stop treating the repository as scaffolding. The project now has a compiling LeanPhysics namespace, a small bounded-operator theorem layer, state and observable predicates, expectation-value lemmas, a unitary interface, and finite-dimensional qubit examples that exercise the current API.

The sprint should not expand further by adding heavy mathematical targets. The next work should move into the first Phase 1 dependency audits and selected theorem growth.

## What Landed

- Lean 4 + Mathlib project with a green `lake build`
- Thin `BoundedOperator` alias over `ContinuousLinearMap`
- `PureState` predicate with basic norm consequences
- `PhaseEquivalent` predicate with unit-norm scalar invariance
- `Observable` predicate over bounded self-adjoint operators
- Observable closure under zero, addition, negation, subtraction, real scalar multiplication, conjugation, and `A†A`
- First `expectationValue` definition and algebraic lemmas
- Expectation values of observables are fixed by `star`; over `Complex`, their imaginary part is zero
- Stage-one `UnitaryOperator` alias over Mathlib's `unitary (H →L[𝕜] H)`
- Unitary identity, composition, norm-preservation, and inner-product-preservation lemmas
- Qubit example on `EuclideanSpace Complex (Fin 2)`
- Identity and Pauli-Z-style observable examples with expectation checks
- First import-thinning pass: `LeanPhysics.Basic` no longer imports all of `Mathlib`

## Mathlib API Findings

- Use `InnerProductSpace` and `CompleteSpace` directly instead of creating a local `HilbertSpace` structure in the bootstrap layer.
- Use `ContinuousLinearMap` for bounded operators. The local `BoundedOperator` name should remain an alias, not a wrapper.
- Use `ContinuousLinearMap.adjoint` and the star instance on `H →L[𝕜] H` for adjoint-facing proofs.
- Use `IsSelfAdjoint` as the observable predicate. The local `Observable` name should remain a predicate unless a later abstraction clearly needs bundled data.
- Use Mathlib's `unitary (H →L[𝕜] H)` for unitary operators. It already gives the right subgroup structure and connects to norm and inner-product preservation.
- Use `EuclideanSpace 𝕜 (Fin n)` for finite-dimensional Hilbert examples. A plain `Fin n → 𝕜` alias does not expose the desired Hilbert-space instances as cleanly.
- Use `Matrix.toEuclideanLin.toContinuousLinearMap` for matrix-backed finite-dimensional operators.
- Use `Matrix.isSymmetric_toEuclideanLin_iff` and `LinearMap.IsSymmetric.isSelfAdjoint` to bridge Hermitian matrices to observable continuous linear maps.
- Use targeted imports where practical. `LeanPhysics.Basic` currently needs `Mathlib.Analysis.InnerProductSpace.Adjoint` and `Mathlib.Tactic`, not all of `Mathlib`.

## Deliberately Deferred

- Full spectral theorem
- Projection-valued measures
- General spectrum and resolvent theory
- Compact operators and trace class
- Unbounded operators
- RG flow
- Noncommutative spectral geometry

These are Phase 1+ concerns, not bootstrap concerns.

## Next Direction

- Start recording Mathlib gaps and available APIs before introducing new local abstractions.
- Decide whether the next theorem increment should target projector/positivity lemmas or a broader bounded-operator spectrum audit.
- Keep finite-dimensional examples close to the theorem layer, especially when new observable or expectation-value lemmas are added.
