import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure PartitionCongruencePackage where
  p : ℕ → ℕ
  congruence5 : ∀ n : ℕ, p (5*n + 4) % 5 = 0
  congruence7 : ∀ n : ℕ, p (7*n + 5) % 7 = 0
  congruence11 : ∀ n : ℕ, p (11*n + 6) % 11 = 0

structure PartitionCongruenceEvidence (C : PartitionCongruencePackage) where
  congruence5Closed : C.congruence5
  congruence7Closed : C.congruence7
  congruence11Closed : C.congruence11

def PartitionCongruenceClosed (C : PartitionCongruencePackage) : Prop :=
  C.congruence5 ∧ C.congruence7 ∧ C.congruence11

theorem partition_congruence_closed_from_evidence (C : PartitionCongruencePackage) (Ev : PartitionCongruenceEvidence C) : PartitionCongruenceClosed C :=
  And.intro Ev.congruence5Closed (And.intro Ev.congruence7Closed Ev.congruence11Closed)

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse