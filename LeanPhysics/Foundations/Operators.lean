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

end LeanPhysics
