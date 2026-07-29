import ElementaryTheoryPartitionsCanonicalLaneLean.PartitionCore

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure AdmissibleClass where
  object : PartitionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PartitionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse