# LeanPhysics

Initial Lean 4 + Mathlib workspace for formalizing the operator-theoretic foundations of quantum mechanics and related mathematical physics.

## Layout

- `STATUS.md`: high-level current-state view
- `milestones/`: major findings, decisions, and research turning points
- `LEAN_PHYSICS_MASTER_PLAN.md`: long-range roadmap
- `LeanPhysics/`: Lean source tree

## First target

Build a stable bounded-operator and state-space foundation before attempting the spectral theorem, unbounded operators, renormalization-group machinery, or spectral geometry.

## Build

```bash
lake update
lake build
```
