/-
Minimal finite-dimensional example to keep the abstraction layer grounded.
-/

import LeanPhysics.Quantum.Observables

namespace LeanPhysics

noncomputable section

abbrev Qubit := EuclideanSpace Complex (Fin 2)

def qubitZero : Qubit :=
  !₂[(1 : Complex), 0]

theorem qubitZero_ne_zero : qubitZero ≠ 0 := by
  intro h
  have h0 := congrArg (fun ψ : Qubit => ψ (0 : Fin 2)) h
  simp [qubitZero] at h0

def qubitId : BoundedOperator (𝕜 := Complex) (H := Qubit) :=
  ContinuousLinearMap.id Complex Qubit

theorem qubitId_apply (ψ : Qubit) : qubitId ψ = ψ := rfl

theorem qubitId_gram_observable :
    Observable (qubitId.adjoint ∘L qubitId) := by
  simpa [qubitId] using
    observable_adjoint_comp_self
      (A := qubitId)

theorem qubitId_gram_apply_qubitZero :
    (qubitId.adjoint ∘L qubitId) qubitZero = qubitZero := by
  simp [qubitId, qubitZero]

end

end LeanPhysics
