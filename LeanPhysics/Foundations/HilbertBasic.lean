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

theorem PureState.norm_ne_zero {ψ : H} (hψ : PureState ψ) : ‖ψ‖ ≠ 0 := by
  rw [hψ.norm_eq_one]
  norm_num

theorem PureState.norm_sq_eq_one {ψ : H} (hψ : PureState ψ) : ‖ψ‖ ^ 2 = (1 : ℝ) := by
  rw [hψ.norm_eq_one]
  norm_num

theorem not_pureState_zero : ¬ PureState (0 : H) := by
  intro h
  exact h.ne_zero rfl

theorem pureState_congr {ψ φ : H} (hψ : PureState ψ) (hEq : φ = ψ) : PureState φ := by
  simpa [hEq] using hψ

theorem pureState_iff {ψ : H} : PureState ψ ↔ ψ ≠ 0 ∧ ‖ψ‖ = 1 :=
  Iff.rfl

end LeanPhysics
