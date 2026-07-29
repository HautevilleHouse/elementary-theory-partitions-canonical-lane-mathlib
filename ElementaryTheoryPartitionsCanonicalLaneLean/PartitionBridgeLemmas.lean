import canonicalLaneMathlib.AdmissibleClass
import ElementaryTheoryPartitionsCanonicalLaneLean.PartitionAdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  partitionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse