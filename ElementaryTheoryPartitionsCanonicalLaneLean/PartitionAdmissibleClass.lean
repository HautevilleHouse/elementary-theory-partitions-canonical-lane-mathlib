import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure PartitionAdmittedObject where
  n : ℕ
  partitions : ℕ
  formulaRepresentation : Prop
  conclusion : partitions = 0 ∨ partitions > 0

def partitionWitnessClosed (O : PartitionAdmittedObject) : Prop :=
  O.conclusion

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse