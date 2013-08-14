require_relative '../prime_enumerator'
class PrimeEnumerator::LazyErastothenes < PrimeEnumerator

  def initialize
    candidate = 2
    eliminators = []

    super() do |yielder|
      loop do
        prime = true

        eliminators.each do |eliminator|
          if eliminator[:composite] == candidate
            eliminator[:composite] = eliminator[:composite] + eliminator[:prime]
            prime = false
          end
        end

        if prime
          eliminators << {prime: candidate, composite: candidate*candidate}
          yielder << candidate
        end

        candidate += 1
      end
    end
  end

end
