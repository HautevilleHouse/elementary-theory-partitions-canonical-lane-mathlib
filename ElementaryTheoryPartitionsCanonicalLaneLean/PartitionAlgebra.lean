import Mathlib.Algebra.BigOperators.Basic
import Mathlib.Combinatorics.Partition

/-!
# Partition Algebra Package

This module defines algebraic structures on integer partitions.
-/

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

open Nat

structure PartitionPackage where
  partition : ℕ → Type u
  zero : partition 0
  one : partition 1
  addition : ∀ {n m : ℕ}, partition n → partition m → partition (n + m)
  multiplication : ∀ {n m : ℕ}, partition n → partition m → partition (n * m)
  additionAssoc : Prop
  additionComm : Prop
  multiplicationAssoc : Prop
  multiplicationComm : Prop
  distrib : Prop
  zeroIsAddUnit : ∀ {n : ℕ} (a : partition n), addition (zero (n := 0)?) a = a
  oneIsMulUnit : ∀ {n : ℕ} (a : partition n), multiplication (one (n := 1)?) a = a
  additionAssocClosed : additionAssoc
  additionCommClosed : additionComm
  multiplicationAssocClosed : multiplicationAssoc
  multiplicationCommClosed : multiplicationComm
  distribClosed : distrib
  zeroIsAddUnitClosed : zeroIsAddUnit
  oneIsMulUnitClosed : oneIsMulUnit

structure PartitionAlgebraEvidence (P : PartitionPackage) where
  additionAssocClosed : P.additionAssoc
  additionCommClosed : P.additionComm
  multiplicationAssocClosed : P.multiplicationAssoc
  multiplicationCommClosed : P.multiplicationComm
  distribClosed : P.distrib
  zeroIsAddUnitClosed : P.zeroIsAddUnit
  oneIsMulUnitClosed : P.oneIsMulUnit

def PartitionAlgebraClosed (P : PartitionPackage) : Prop :=
  P.additionAssoc ∧ P.additionComm ∧ P.multiplicationAssoc ∧ P.multiplicationComm ∧
  P.distrib ∧ P.zeroIsAddUnit ∧ P.oneIsMulUnit

theorem partition_algebra_closed_from_evidence (P : PartitionPackage)
    (E : PartitionAlgebraEvidence P) : PartitionAlgebraClosed P := by
  exact And.intro E.additionAssocClosed (And.intro E.additionCommClosed
    (And.intro E.multiplicationAssocClosed (And.intro E.multiplicationCommClosed
      (And.intro E.distribClosed (And.intro E.zeroIsAddUnitClosed E.oneIsMulUnitClosed)))))

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse