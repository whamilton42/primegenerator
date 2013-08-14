require_relative '../prime_enumerator'
class PrimeEnumerator::LazyEratosthenes < PrimeEnumerator

  def initialize
    candidate = 2
    eliminators = {}
    # {
    # 	0 => nil,
    # 	1 => nil,
    # 	2 => 4,
    # 	3 => 9,
    # 	4 => nil,
    # 	5 => 25
    # }

    super() do |yielder|
      loop do
        prime = true

        eliminators.each do |original, composite|
          if composite == candidate
            eliminators[original] += original
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
