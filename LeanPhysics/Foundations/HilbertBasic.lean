/-
Foundational definitions for Hilbert-space level reasoning.
-/

import LeanPhysics.Basic

namespace LeanPhysics

open scoped ComplexConjugate

variable {𝕜 : Type*} [RCLike 𝕜]
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]

/-- A pure state is a normalized nonzero vector. -/
def PureState (ψ : H) : Prop :=
  ψ ≠ 0 ∧ ‖ψ‖ = 1

theorem PureState.ne_zero {ψ : H} (hψ : PureState ψ) : ψ ≠ 0 :=
  hψ.1

theorem PureState.norm_eq_one {ψ : H} (hψ : PureState ψ) : ‖ψ‖ = 1 :=
  hψ.2

theorem pureState_iff {ψ : H} : PureState ψ ↔ ψ ≠ 0 ∧ ‖ψ‖ = 1 :=
  Iff.rfl

end LeanPhysics
