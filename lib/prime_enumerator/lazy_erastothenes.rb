require_relative '../prime_enumerator'
class PrimeEnumerator::LazyErastothenes < PrimeEnumerator

  def initialize
    candidate = 2
    eliminators = []

    super() do |yielder|
      loop do
        prime = true

        eliminators.each_with_index do |eliminator, index|
          if eliminator == candidate
            eliminators[index] += index
            prime = false
          end
        end

        if prime
          eliminators[candidate] = candidate*candidate
          yielder << candidate
        end

        candidate += 1
      end
    end
  end

end
