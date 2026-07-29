import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElementaryTheoryPartitionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PartitionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse