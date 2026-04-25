# Phase 1 Dependency Audit Start

Date: 2026-04-25

## Purpose

This starts the Phase 1 dependency audit called for by the master plan. The goal is to identify which Mathlib structures should be used directly before adding local abstractions for Hilbert spaces, bounded operators, spectrum, spectral theory, compact operators, or trace-class machinery.

## Current Read

Phase 1 should start as an audit, not as a new abstraction push. The First Sprint already showed that thin aliases and predicates are enough for the bootstrap layer:

- `BoundedOperator` is an alias for `H ->L[𝕜] H`
- `Observable A` is a predicate over `IsSelfAdjoint A`
- `UnitaryOperator` is an alias over `unitary (H ->L[𝕜] H)`

That pattern should remain the default until a theorem genuinely needs bundled data.

## Phase 1.1: Hilbert Space Formalism

Confirmed useful Mathlib surface:

- `InnerProductSpace`
- `CompleteSpace`
- `ContinuousLinearMap`
- `ContinuousLinearMap.adjoint`
- `LinearIsometryEquiv`
- `OrthonormalBasis`
- `EuclideanSpace 𝕜 ι`
- `TensorProduct` and related linear algebra tensor product files

Initial decision:

- Do not introduce the master plan's proposed custom `HilbertSpace` structure yet.
- Continue using the Mathlib typeclass stack directly:
  `[NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]`
- Add `SeparableSpace` only when a theorem actually needs separability.

Open checks:

- Exact API for Parseval-style statements.
- Exact API for separability assumptions on infinite-dimensional Hilbert spaces.
- Best import path for tensor products in Hilbert-space examples.

## Phase 1.2: Bounded Operators And Spectrum

Confirmed useful Mathlib surface:

- `ContinuousLinearMap` for bounded operators.
- Operator norm is already available through the normed structure on continuous linear maps.
- `ContinuousLinearMap.adjoint` plus the star instance gives adjoint-facing algebra on endomorphisms.
- `IsSelfAdjoint` is already the right self-adjointness predicate.
- `unitary (H ->L[𝕜] H)` already supplies the unitary subgroup.
- `Mathlib.Analysis.Normed.Algebra.Spectrum` contains Banach-algebra spectrum and resolvent API.

Initial decision:

- Do not define a local `Spectrum` yet.
- First test Mathlib's `spectrum 𝕜 a`, `resolventSet 𝕜 a`, and `resolvent a z` against `BoundedOperator`.
- Prefer theorem wrappers only after a local statement has proved useful in at least one Lean file.

Open checks:

- Whether `H ->L[𝕜] H` has the exact normed algebra instances needed for the spectrum API without extra imports.
- How much of "self-adjoint operators have real spectrum" is already available for continuous linear maps.
- Whether point spectrum/eigenvalue APIs are better handled through `LinearMap` eigenspaces first, before Banach-algebra spectrum.

## Near-Term Next Step

Add a small Lean probe or audit note for the spectrum API on `BoundedOperator`, without trying to prove the full spectral theorem. The target should be a compiling statement-level check or one simple lemma connecting `BoundedOperator` to Mathlib's `spectrum` API.
