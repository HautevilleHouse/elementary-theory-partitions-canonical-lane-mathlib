import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure PartitionPackage where
  n : ℕ
  parts : List ℕ
  sumProperty : parts.sum = n
  positiveParts : ∀ p ∈ parts, p > 0
  orderDontMatter : Prop  -- partitions are unordered
  ferrersDiagram : List ℕ -> FerrersDiagram
  youngDiagram : List ℕ -> YoungDiagram

structure FerrersDiagram where
  rows : ℕ
  cols : ℕ
  shape : List ℕ  -- row lengths

structure YoungDiagram where
  shape : List ℕ
  standardYoungTableaux : Prop

structure PartitionEvidence (P : PartitionPackage) where
  orderDontMatterClosed : P.orderDontMatter
  ferrersDiagramClosed : P.ferrersDiagram P.parts = FerrersDiagram.mk (P.parts.length) (P.parts.maximum? 0) P.parts
  youngDiagramClosed : P.youngDiagram P.parts = YoungDiagram.mk P.parts (P.parts.length = 1)

def PartitionClosed (P : PartitionPackage) : Prop :=
  P.orderDontMatter ∧
  (∃ fd : FerrersDiagram, P.ferrersDiagram P.parts = fd) ∧
  (∃ yd : YoungDiagram, P.youngDiagram P.parts = yd)

theorem partition_closed_from_evidence (P : PartitionPackage) (E : PartitionEvidence P) : PartitionClosed P := by
  exact And.intro E.orderDontMatterClosed (And.intro (Exists.intro (FerrersDiagram.mk (P.parts.length) (P.parts.maximum? 0) P.parts) E.ferrersDiagramClosed) (Exists.intro (YoungDiagram.mk P.parts (P.parts.length = 1)) E.youngDiagramClosed))

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse