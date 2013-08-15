require_relative '../prime_enumerator'
class PrimeEnumerator::Eratosthenes < PrimeEnumerator

  def initialize(args)
    upper_bound = args.fetch(:upper_bound)
     candidates = (0..upper_bound).collect { |num| true }
    prime = 2

    super() do |yielder|
      loop do

        while prime*prime <= upper_bound
          if candidates[prime]
            yielder << prime

            eliminate = prime*prime
            if eliminate > upper_bound
              raise StopIteration
            else
              while eliminate < upper_bound
                candidates[eliminate] = false
                eliminate += prime
              end
            end
          end

          prime += 1
        end

        # If we're beyond the upper bound, we can safely assume that all of the remaining numbers are primes.
        (2...upper_bound).find_all { |i| i > prime and candidates[i] }.each { |prime| yielder << prime }
      end
    end
  end

end
