/-
Quantum-state definitions built on the Hilbert-space layer.
-/

import LeanPhysics.Foundations.HilbertBasic

namespace LeanPhysics

variable {𝕜 : Type*} [RCLike 𝕜]
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]

/-- Two vectors are phase equivalent when they differ by a unit scalar. -/
def PhaseEquivalent (ψ φ : H) : Prop :=
  ∃ c : 𝕜, ‖c‖ = 1 ∧ c • ψ = φ

theorem phaseEquivalent_refl (ψ : H) : PhaseEquivalent (𝕜 := 𝕜) ψ ψ := by
  refine ⟨(1 : 𝕜), by simp, by simp⟩

theorem phaseEquivalent_of_norm_one_smul (ψ : H) {c : 𝕜}
    (hc : ‖c‖ = 1) : PhaseEquivalent (𝕜 := 𝕜) ψ (c • ψ) := by
  exact ⟨c, hc, rfl⟩

theorem phaseEquivalent_trans {ψ φ χ : H}
    (h₁ : PhaseEquivalent (𝕜 := 𝕜) ψ φ)
    (h₂ : PhaseEquivalent (𝕜 := 𝕜) φ χ) :
    PhaseEquivalent (𝕜 := 𝕜) ψ χ := by
  rcases h₁ with ⟨c₁, hc₁, rfl⟩
  rcases h₂ with ⟨c₂, hc₂, rfl⟩
  refine ⟨c₂ * c₁, by simp [norm_mul, hc₁, hc₂], ?_⟩
  simp [smul_smul, mul_comm]

theorem pureState_smul_of_norm_one {ψ : H} (hψ : PureState ψ) {c : 𝕜}
    (hc : ‖c‖ = 1) : PureState (c • ψ) := by
  constructor
  · intro hzero
    have hc0 : c ≠ 0 := by
      intro h
      have : ‖c‖ = 0 := by simp [h]
      linarith [hc]
    apply hψ.1
    exact (smul_eq_zero.mp hzero).resolve_left hc0
  · calc
      ‖c • ψ‖ = ‖c‖ * ‖ψ‖ := norm_smul c ψ
      _ = 1 * 1 := by rw [hc, hψ.2]
      _ = 1 := by norm_num

theorem pureState_of_phaseEquivalent {ψ φ : H} (hψ : PureState ψ)
    (hφ : PhaseEquivalent (𝕜 := 𝕜) ψ φ) : PureState φ := by
  rcases hφ with ⟨c, hc, rfl⟩
  exact pureState_smul_of_norm_one hψ hc

end LeanPhysics
