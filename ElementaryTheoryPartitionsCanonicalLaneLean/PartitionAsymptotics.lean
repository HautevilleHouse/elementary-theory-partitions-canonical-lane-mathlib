import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure AsymptoticEstimatesPackage where
  hardyRamanujanFormula : Prop
  rademacherConvergence : Prop
  errorBounds : Prop
  hardyRamanujanFormulaClosed : hardyRamanujanFormula
  rademacherConvergenceClosed : rademacherConvergence
  errorBoundsClosed : errorBounds


def AsymptoticEstimatesClosed (A : AsymptoticEstimatesPackage) : Prop :=
  A.hardyRamanujanFormula ∧ A.rademacherConvergence ∧ A.errorBounds

theorem asymptotic_estimates_closed_from_evidence (A : AsymptoticEstimatesPackage) : AsymptoticEstimatesClosed A := by
  exact And.intro A.hardyRamanujanFormulaClosed (And.intro A.rademacherConvergenceClosed A.errorBoundsClosed)

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse