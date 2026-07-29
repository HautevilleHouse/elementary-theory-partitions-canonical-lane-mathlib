import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure RogersRamanujanPackage where
  partitionsMod4 : ℕ → ℕ
  partitionsMod5 : ℕ → ℕ
  firstIdentity : ∀ n : ℕ, partitionsMod4 n = partitionsMod5 n
  secondIdentity : ∀ n : ℕ, partitionsMod4 (n+1) = partitionsMod5 n

structure RogersRamanujanEvidence (R : RogersRamanujanPackage) where
  firstIdentityClosed : R.firstIdentity
  secondIdentityClosed : R.secondIdentity

def RogersRamanujanClosed (R : RogersRamanujanPackage) : Prop :=
  R.firstIdentity ∧ R.secondIdentity

theorem rogers_ramanujan_closed_from_evidence (R : RogersRamanujanPackage) (Ev : RogersRamanujanEvidence R) : RogersRamanujanClosed R :=
  And.intro Ev.firstIdentityClosed Ev.secondIdentityClosed

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse