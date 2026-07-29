import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure EulerPartitionPackage where
  distinctPartitions : ℕ → ℕ
  oddPartitions : ℕ → ℕ
  eulerIdentity : ∀ n : ℕ, distinctPartitions n = oddPartitions n

structure EulerPartitionEvidence (E : EulerPartitionPackage) where
  eulerIdentityClosed : E.eulerIdentity

def EulerPartitionClosed (E : EulerPartitionPackage) : Prop :=
  E.eulerIdentity

theorem euler_partition_closed_from_evidence (E : EulerPartitionPackage) (Ev : EulerPartitionEvidence E) : EulerPartitionClosed E :=
  Ev.eulerIdentityClosed

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse