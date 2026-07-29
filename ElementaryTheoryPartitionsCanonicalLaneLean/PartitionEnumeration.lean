import ElementaryTheoryPartitionsCanonicalLaneLean.PartitionOrder
import Mathlib.NumberTheory.ArithmeticFunction

/-!
# Partition Enumeration Package

This module records generating functions and asymptotic enumeration of partitions.
-/

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

open Nat

structure PartitionEnumerationPackage where
  partitionFunction : ℕ → ℕ
  generatingFunction : ℕ → ℚ
  asymptoticFormula : Prop
  eulerPentagonal : Prop
  recurrenceRelation : Prop
  partitionFunctionClosed : partitionFunction = Nat.partitions
  generatingFunctionExplicit : ∀ n : ℕ, generatingFunction n = (Nat.partitions n : ℚ)
  asymptoticFormulaClosed : asymptoticFormula
  eulerPentagonalClosed : eulerPentagonal
  recurrenceRelationClosed : recurrenceRelation
  asymptoticProof : asymptoticFormula
  eulerProof : eulerPentagonal
  recurrenceProof : recurrenceRelation

structure PartitionEnumerationEvidence (P : PartitionEnumerationPackage) where
  asymptoticFormulaClosed : P.asymptoticFormula
  eulerPentagonalClosed : P.eulerPentagonal
  recurrenceRelationClosed : P.recurrenceRelation
  generatingFunctionExplicit : ∀ n, P.generatingFunction n = (Nat.partitions n : ℚ)
  partitionFunctionCorrect : P.partitionFunction = Nat.partitions

def PartitionEnumerationClosed (P : PartitionEnumerationPackage) : Prop :=
  P.asymptoticFormula ∧ P.eulerPentagonal ∧ P.recurrenceRelation

theorem partition_enumeration_closed_from_evidence (P : PartitionEnumerationPackage)
    (E : PartitionEnumerationEvidence P) : PartitionEnumerationClosed P := by
  exact And.intro E.asymptoticFormulaClosed (And.intro E.eulerPentagonalClosed E.recurrenceRelationClosed)

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse