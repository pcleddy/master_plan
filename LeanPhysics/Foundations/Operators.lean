/-
Wrappers for the initial bounded-operator layer.
-/

import LeanPhysics.Foundations.HilbertBasic

namespace LeanPhysics

variable {𝕜 : Type*} [RCLike 𝕜]
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]

/-- Initial bounded operators are Mathlib continuous linear maps. -/
abbrev BoundedOperator :=
  H →L[𝕜] H

theorem boundedOperator_id_exists : Nonempty (BoundedOperator (𝕜 := 𝕜) (H := H)) :=
  ⟨ContinuousLinearMap.id 𝕜 H⟩

theorem boundedOperator_zero_apply (ψ : H) :
    (0 : BoundedOperator (𝕜 := 𝕜) (H := H)) ψ = 0 := rfl

theorem boundedOperator_id_apply (ψ : H) :
    (ContinuousLinearMap.id 𝕜 H : BoundedOperator (𝕜 := 𝕜) (H := H)) ψ = ψ := rfl

theorem boundedOperator_add_apply {A B : BoundedOperator (𝕜 := 𝕜) (H := H)} (ψ : H) :
    (A + B) ψ = A ψ + B ψ :=
  rfl

theorem boundedOperator_smul_apply (c : 𝕜) {A : BoundedOperator (𝕜 := 𝕜) (H := H)} (ψ : H) :
    (c • A) ψ = c • A ψ :=
  rfl

def boundedOperatorComp (A B : BoundedOperator (𝕜 := 𝕜) (H := H)) :
    BoundedOperator (𝕜 := 𝕜) (H := H) :=
  A.comp B

@[simp] theorem boundedOperatorComp_apply {A B : BoundedOperator (𝕜 := 𝕜) (H := H)} (ψ : H) :
    boundedOperatorComp A B ψ = A (B ψ) :=
  rfl

end LeanPhysics
