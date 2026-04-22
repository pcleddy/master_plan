# Bounded Observable Closure Batch

Date: 2026-04-20

## Finding

The first reusable bounded-operator and observable closure layer now compiles cleanly. This is enough structure to write small operator-facing lemmas without inventing a custom abstraction stack first.

## What Landed

- `Foundations/Operators` now exposes evaluation lemmas for `0`, `id`, addition, scalar multiplication, and composition
- `Quantum/Observables` now proves closure for bounded self-adjoint operators under `0`, addition, negation, subtraction, and real scalar multiplication
- `Quantum/Observables` now also exposes two first bridge lemmas: conjugation preserves observability, and every Gram operator `A†A` is observable
- `Quantum/Observables` now includes a minimal expectation-value definition with algebraic lemmas for `0`, addition, and scalar multiplication
- `Quantum/Examples/Qubit` now uses the standard finite-dimensional Hilbert-space model `EuclideanSpace Complex (Fin 2)` and checks the identity Gram operator in that setting
- `lake build` succeeds after this theorem batch

## Why This Matters

This is the first point where the bounded-operator-first plan is expressed as reusable code instead of only project intent. The observable layer now supports small algebraic manipulations directly, and the project has a first expectation-value expression plus a finite-dimensional Hilbert-space sanity example to test it against.

## Follow-on

- prove the first observable-specific expectation result, ideally that self-adjoint operators have real expectation values
- add a nontrivial finite-dimensional operator example beyond the identity sanity check
- keep imports thin while the theorem layer is still small
