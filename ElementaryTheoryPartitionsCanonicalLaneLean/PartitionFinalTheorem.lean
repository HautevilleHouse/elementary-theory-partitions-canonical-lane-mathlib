import canonicalLaneMathlib.AdmissibleClass
import ElementaryTheoryPartitionsCanonicalLaneLean.PartitionGateLemmas

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

def ConstrainedPartitionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_partition_endgame (A : AdmissibleClass) : ConstrainedPartitionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse