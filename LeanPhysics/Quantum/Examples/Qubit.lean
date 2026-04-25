/-
Minimal finite-dimensional example to keep the abstraction layer grounded.
-/

import LeanPhysics.Quantum.Observables
import Mathlib.Analysis.Matrix.Hermitian

namespace LeanPhysics

noncomputable section

abbrev Qubit := EuclideanSpace Complex (Fin 2)
abbrev QubitMatrix := Matrix (Fin 2) (Fin 2) Complex

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

def pauliZMatrix : QubitMatrix :=
  !![(1 : Complex), 0; 0, (-1 : Complex)]

def qubitPauliZ : BoundedOperator (𝕜 := Complex) (H := Qubit) :=
  pauliZMatrix.toEuclideanLin.toContinuousLinearMap

theorem pauliZMatrix_isHermitian : pauliZMatrix.IsHermitian := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [pauliZMatrix]

theorem qubitPauliZ_observable : Observable qubitPauliZ := by
  rw [Observable]
  apply LinearMap.IsSymmetric.isSelfAdjoint
  exact Matrix.isSymmetric_toEuclideanLin_iff.mpr pauliZMatrix_isHermitian

theorem qubitPauliZ_apply_qubitZero :
    qubitPauliZ qubitZero = qubitZero := by
  ext i
  fin_cases i <;> simp [qubitPauliZ, pauliZMatrix, qubitZero]

theorem qubitZero_eq_single :
    qubitZero = EuclideanSpace.single (0 : Fin 2) (1 : Complex) := by
  ext i
  fin_cases i <;> simp [qubitZero]

theorem qubitPauliZ_expectation_qubitZero :
    expectationValue (𝕜 := Complex) (H := Qubit) qubitPauliZ qubitZero = (1 : Complex) := by
  rw [expectationValue, qubitPauliZ_apply_qubitZero, qubitZero_eq_single]
  simp

end

end LeanPhysics
