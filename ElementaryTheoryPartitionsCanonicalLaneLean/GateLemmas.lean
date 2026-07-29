import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElementaryTheoryPartitionsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse