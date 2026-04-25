# Bounded Operator Spectrum API Probe

Date: 2026-04-25

## Purpose

This records the first compiling Phase 1.2 probe against Mathlib's Banach-algebra spectrum API for project bounded operators.

## What Compiles

Added `LeanPhysics/Foundations/Spectrum.lean`.

The module exposes thin project-facing names around Mathlib definitions:

- `boundedOperatorSpectrum A := spectrum 𝕜 A`
- `boundedOperatorResolventSet A := resolventSet 𝕜 A`
- `boundedOperatorResolvent A z := resolvent A z`

The first reusable facts compile for `BoundedOperator`:

- `boundedOperator_resolventSet_isOpen`
- `boundedOperator_spectrum_isClosed`
- `boundedOperator_spectrum_norm_le_norm_mul_one`

## API Finding

`H ->L[𝕜] H` has the normed-algebra and completeness instances needed for the basic spectrum API when `H` is complete. This means the project should continue using Mathlib's `spectrum`, `resolventSet`, and `resolvent` directly rather than defining a local spectrum type.

The sharper Mathlib theorem `spectrum.norm_le_norm_of_mem` requires a `NormOneClass` instance. Instance synthesis did not find that instance for the current `BoundedOperator` alias, so the probe uses the general Banach-algebra theorem:

`‖z‖ ≤ ‖A‖ * ‖(1 : BoundedOperator)‖`

This is enough to confirm the spectrum API path. A later cleanup can investigate whether the sharper operator norm bound should be exposed through an existing theorem, an instance, or a small local lemma.

## Next Step

Check Mathlib support for self-adjoint spectrum restrictions and real-spectrum facts. Candidate files found during API discovery include:

- `Mathlib.Analysis.InnerProductSpace.StarOrder`
- `Mathlib.Analysis.InnerProductSpace.Rayleigh`
- continuous functional calculus files under `Mathlib.Analysis.SpecialFunctions.ContinuousFunctionalCalculus`
