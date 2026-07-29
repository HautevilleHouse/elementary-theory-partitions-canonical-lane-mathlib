import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElementaryTheoryPartitionsCanonicalLaneLean.PartitionDefinitions

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure GeneratingFunctionPackage where
  formalPowerSeries : ℕ → ℚ
  partitionGeneratingFunction : ℕ → ℚ
  eulerProduct : ℕ → ℚ
  convergenceRadius : ℝ
  functionalEquation : Prop

structure GeneratingFunctionEvidence (G : GeneratingFunctionPackage) where
  partitionGeneratingFormula : ∀ n, G.partitionGeneratingFunction n = G.formalPowerSeries n
  eulerProductFormula : ∀ n, G.eulerProduct n = ∏_{k=1}^{∞} 1/(1 - G.formalPowerSeries 1^k)
  convergenceRadiusClosed : G.convergenceRadius = 1
  functionalEquationClosed : G.functionalEquation

def GeneratingFunctionClosed (G : GeneratingFunctionPackage) : Prop :=
  (∀ n, G.partitionGeneratingFunction n = G.formalPowerSeries n) ∧
  (∀ n, G.eulerProduct n = ∏_{k=1}^{∞} 1/(1 - G.formalPowerSeries 1^k)) ∧
  G.convergenceRadius = 1 ∧
  G.functionalEquation

theorem generating_function_closed_from_evidence (G : GeneratingFunctionPackage) (E : GeneratingFunctionEvidence G) : GeneratingFunctionClosed G := by
  exact And.intro E.partitionGeneratingFormula (And.intro E.eulerProductFormula (And.intro E.convergenceRadiusClosed E.functionalEquationClosed))

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse