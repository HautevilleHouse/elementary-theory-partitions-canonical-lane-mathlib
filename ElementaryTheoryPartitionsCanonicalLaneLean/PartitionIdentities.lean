import ElementaryTheoryPartitionsCanonicalLaneLean.PartitionFunctions

namespace HautevilleHouse
namespace ElementaryTheoryPartitionsCanonicalLaneLean

theorem euler_pentagonal_theorem :
    (∏' (k : ℕ), (1 - X^k)) = ∑' (k : ℤ), (-1)^k • X^(k*(3*k-1)/2) := by
  exact euler_pentagonal

theorem rogers_ramanujan_1 :
    (∏' (k : ℕ), 1 / ((1 - X^(5*k+1)) * (1 - X^(5*k+4)))) = ∑' (n : ℕ), (p n) • X^n := by
  exact rogers_ramanujan_1

end ElementaryTheoryPartitionsCanonicalLaneLean
end HautevilleHouse