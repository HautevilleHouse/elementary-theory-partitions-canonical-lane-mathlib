import ElementaryTheoryPartitionsCanonicalLaneLean.PartitionCore

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

def p (n : ℕ) : ℕ :=
  (Finset.filter (λ (π : Partition) => partitionWeight π = n) (Finset.univ : Finset (Finset.range (n+1)))).card

theorem generating_function_identity :
    (∏' (k : ℕ), (1 - X^k)⁻¹) = ∑' (n : ℕ), p n • X^n := by
  -- This identity is a standard result; we refer to the lemma from PartitionCore.
  -- Since the definitions match, we simply apply the lemma.
  exact Partition.generatingFunction_identity

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse