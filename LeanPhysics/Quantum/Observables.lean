/-
Bounded observables for the first project stage.
-/

import LeanPhysics.Foundations.Operators

namespace LeanPhysics

variable {𝕜 : Type*} [RCLike 𝕜]
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]

/-- Stage-one observables are bounded self-adjoint operators. -/
def Observable (A : BoundedOperator (𝕜 := 𝕜) (H := H)) : Prop :=
  IsSelfAdjoint A

theorem observable_zero : Observable (0 : BoundedOperator (𝕜 := 𝕜) (H := H)) := by
  simp [Observable]

theorem observable_add {A B : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hA : Observable A) (hB : Observable B) : Observable (A + B) := by
  simpa [Observable] using hA.add hB

end LeanPhysics
