import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

structure GeneratingFunctionPackage where
  formalPowerSeries : Type u
  productFormula : Prop
  pentagonalNumberTheorem : Prop
  eulerRecurrence : Prop
  productFormulaClosed : productFormula
  pentagonalNumberTheoremClosed : pentagonalNumberTheorem
  eulerRecurrenceClosed : eulerRecurrence


def GeneratingFunctionClosed (G : GeneratingFunctionPackage) : Prop :=
  G.productFormula ∧ G.pentagonalNumberTheorem ∧ G.eulerRecurrence

theorem generating_function_closed_from_evidence (G : GeneratingFunctionPackage) : GeneratingFunctionClosed G := by
  exact And.intro G.productFormulaClosed (And.intro G.pentagonalNumberTheoremClosed G.eulerRecurrenceClosed)

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse