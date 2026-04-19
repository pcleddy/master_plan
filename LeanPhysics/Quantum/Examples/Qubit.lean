/-
Minimal finite-dimensional example to keep the abstraction layer grounded.
-/

import LeanPhysics.Quantum.States

namespace LeanPhysics

abbrev Qubit := Fin 2 → Complex

def qubitZero : Qubit :=
  fun i => if i = 0 then 1 else 0

theorem qubitZero_ne_zero : qubitZero ≠ 0 := by
  intro h
  have h0 := congrFun h 0
  simp [qubitZero] at h0

end LeanPhysics
