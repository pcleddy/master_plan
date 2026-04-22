/-
Basic unitary-operator interface for the first project stage.
-/

import LeanPhysics.Foundations.Operators

namespace LeanPhysics

noncomputable section

variable {𝕜 : Type*} [RCLike 𝕜]
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]

/-- Stage-one unitary operators are Mathlib unitary bounded operators. -/
abbrev UnitaryOperator :=
  unitary (BoundedOperator (𝕜 := 𝕜) (H := H))

theorem unitaryOperator_one :
    (1 : BoundedOperator (𝕜 := 𝕜) (H := H)) ∈
      unitary (BoundedOperator (𝕜 := 𝕜) (H := H)) :=
  one_mem _

theorem unitaryOperator_id :
    (ContinuousLinearMap.id 𝕜 H : BoundedOperator (𝕜 := 𝕜) (H := H)) ∈
      unitary (BoundedOperator (𝕜 := 𝕜) (H := H)) := by
  simpa [ContinuousLinearMap.one_def] using
    (unitaryOperator_one (𝕜 := 𝕜) (H := H))

theorem unitaryOperator_comp {U V : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hU : U ∈ unitary (BoundedOperator (𝕜 := 𝕜) (H := H)))
    (hV : V ∈ unitary (BoundedOperator (𝕜 := 𝕜) (H := H))) :
    boundedOperatorComp U V ∈ unitary (BoundedOperator (𝕜 := 𝕜) (H := H)) := by
  simpa [boundedOperatorComp, ContinuousLinearMap.mul_def] using mul_mem hU hV

theorem unitaryOperator_norm_map {U : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hU : U ∈ unitary (BoundedOperator (𝕜 := 𝕜) (H := H))) (ψ : H) :
    ‖U ψ‖ = ‖ψ‖ := by
  simpa using U.norm_map_of_mem_unitary hU ψ

theorem unitaryOperator_inner_map_map {U : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hU : U ∈ unitary (BoundedOperator (𝕜 := 𝕜) (H := H))) (ψ φ : H) :
    inner 𝕜 (U ψ) (U φ) = inner 𝕜 ψ φ := by
  simpa using U.inner_map_map_of_mem_unitary hU ψ φ

end

end LeanPhysics
