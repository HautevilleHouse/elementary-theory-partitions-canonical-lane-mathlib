import ElementaryTheoryPartitionsCanonicalLaneLean.PartitionAlgebra
import Mathlib.Combinatorics.Partition

/-!
# Partition Order Package

This module refines partition order and lattice structure.
-/

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

open Nat

structure PartitionOrderPackage where
  partition : ℕ → Type u
  refinement : ∀ {n : ℕ}, partition n → partition n → Prop
  refinementReflexive : ∀ {n : ℕ} (a : partition n), refinement a a
  refinementTransitive : ∀ {n : ℕ} (a b c : partition n),
    refinement a b → refinement b c → refinement a c
  refinementAntisymmetric : ∀ {n : ℕ} (a b : partition n),
    refinement a b → refinement b a → a = b
  sup : ∀ {n : ℕ}, partition n → partition n → partition n
  inf : ∀ {n : ℕ}, partition n → partition n → partition n
  supIsLUB : ∀ {n : ℕ} (a b c : partition n),
    refinement a c → refinement b c → refinement (sup a b) c
  infIsGLB : ∀ {n : ℕ} (a b c : partition n),
    refinement c a → refinement c b → refinement c (inf a b)
  refinementReflexiveClosed : refinementReflexive
  refinementTransitiveClosed : refinementTransitive
  refinementAntisymmetricClosed : refinementAntisymmetric
  supIsLUBClosed : supIsLUB
  infIsGLBClosed : infIsGLB

structure PartitionOrderEvidence (P : PartitionOrderPackage) where
  refinementReflexiveClosed : P.refinementReflexive
  refinementTransitiveClosed : P.refinementTransitive
  refinementAntisymmetricClosed : P.refinementAntisymmetric
  supIsLUBClosed : P.supIsLUB
  infIsGLBClosed : P.infIsGLB

def PartitionOrderClosed (P : PartitionOrderPackage) : Prop :=
  P.refinementReflexive ∧ P.refinementTransitive ∧ P.refinementAntisymmetric ∧
  P.supIsLUB ∧ P.infIsGLB

theorem partition_order_closed_from_evidence (P : PartitionOrderPackage)
    (E : PartitionOrderEvidence P) : PartitionOrderClosed P := by
  exact And.intro E.refinementReflexiveClosed (And.intro E.refinementTransitiveClosed
    (And.intro E.refinementAntisymmetricClosed (And.intro E.supIsLUBClosed E.infIsGLBClosed)))

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse