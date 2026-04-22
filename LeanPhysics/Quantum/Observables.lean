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

/-- Stage-one expectation value of an operator in a state vector. -/
def expectationValue (A : BoundedOperator (𝕜 := 𝕜) (H := H)) (ψ : H) : 𝕜 :=
  inner 𝕜 ψ (A ψ)

theorem observable_zero : Observable (0 : BoundedOperator (𝕜 := 𝕜) (H := H)) := by
  simp [Observable]

theorem observable_add {A B : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hA : Observable A) (hB : Observable B) : Observable (A + B) := by
  simpa [Observable] using hA.add hB

theorem observable_neg {A : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hA : Observable A) : Observable (-A) := by
  simpa [Observable] using hA.neg

theorem observable_sub {A B : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hA : Observable A) (hB : Observable B) : Observable (A - B) := by
  simpa [sub_eq_add_neg] using observable_add hA (observable_neg hB)

theorem observable_smul_real {A : BoundedOperator (𝕜 := 𝕜) (H := H)} {r : ℝ}
    (hA : Observable A) : Observable ((r : 𝕜) • A) := by
  rw [Observable] at hA ⊢
  calc
    star ((r : 𝕜) • A) = star (r : 𝕜) • star A := star_smul _ _
    _ = (r : 𝕜) • A := by
      simpa using congrArg (fun T => (r : 𝕜) • T) hA

theorem observable_conj {A S : BoundedOperator (𝕜 := 𝕜) (H := H)}
    (hA : Observable A) : Observable (S ∘L A ∘L S.adjoint) := by
  simpa [Observable] using hA.conj_adjoint S

theorem observable_adjoint_comp_self (A : BoundedOperator (𝕜 := 𝕜) (H := H)) :
    Observable (A.adjoint ∘L A) := by
  rw [Observable]
  exact IsSelfAdjoint.star_mul_self A

omit [CompleteSpace H] in
theorem expectationValue_zero (ψ : H) :
    expectationValue (𝕜 := 𝕜) (H := H) 0 ψ = 0 := by
  simp [expectationValue]

omit [CompleteSpace H] in
theorem expectationValue_add {A B : BoundedOperator (𝕜 := 𝕜) (H := H)} (ψ : H) :
    expectationValue (𝕜 := 𝕜) (H := H) (A + B) ψ =
      expectationValue (𝕜 := 𝕜) (H := H) A ψ +
        expectationValue (𝕜 := 𝕜) (H := H) B ψ := by
  simp [expectationValue, inner_add_right]

omit [CompleteSpace H] in
theorem expectationValue_smul {A : BoundedOperator (𝕜 := 𝕜) (H := H)} (ψ : H) (c : 𝕜) :
    expectationValue (𝕜 := 𝕜) (H := H) (c • A) ψ =
      c * expectationValue (𝕜 := 𝕜) (H := H) A ψ := by
  simp [expectationValue, inner_smul_right]

end LeanPhysics
