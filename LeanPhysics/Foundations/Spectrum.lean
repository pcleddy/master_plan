/-
Spectrum-facing probes for bounded operators.
-/

import LeanPhysics.Foundations.Operators
import Mathlib.Analysis.Normed.Algebra.Spectrum

namespace LeanPhysics

noncomputable section

variable {𝕜 : Type*} [RCLike 𝕜]
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]

/-- The Mathlib spectrum of a bounded operator, exposed with project terminology. -/
abbrev boundedOperatorSpectrum (A : BoundedOperator (𝕜 := 𝕜) (H := H)) : Set 𝕜 :=
  spectrum 𝕜 A

/-- The Mathlib resolvent set of a bounded operator, exposed with project terminology. -/
abbrev boundedOperatorResolventSet (A : BoundedOperator (𝕜 := 𝕜) (H := H)) : Set 𝕜 :=
  resolventSet 𝕜 A

/-- The Mathlib resolvent function of a bounded operator. -/
abbrev boundedOperatorResolvent (A : BoundedOperator (𝕜 := 𝕜) (H := H)) (z : 𝕜) :
    BoundedOperator (𝕜 := 𝕜) (H := H) :=
  resolvent A z

theorem boundedOperator_resolventSet_isOpen (A : BoundedOperator (𝕜 := 𝕜) (H := H)) :
    IsOpen (boundedOperatorResolventSet A) := by
  exact spectrum.isOpen_resolventSet (𝕜 := 𝕜) A

theorem boundedOperator_spectrum_isClosed (A : BoundedOperator (𝕜 := 𝕜) (H := H)) :
    IsClosed (boundedOperatorSpectrum A) := by
  exact spectrum.isClosed (𝕜 := 𝕜) A

theorem boundedOperator_spectrum_norm_le_norm_mul_one {A : BoundedOperator (𝕜 := 𝕜) (H := H)}
    {z : 𝕜} (hz : z ∈ boundedOperatorSpectrum A) :
    ‖z‖ ≤ ‖A‖ * ‖(1 : BoundedOperator (𝕜 := 𝕜) (H := H))‖ := by
  exact spectrum.norm_le_norm_mul_of_mem (a := A) hz

end

end LeanPhysics
