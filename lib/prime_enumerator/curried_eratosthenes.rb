require_relative '../prime_enumerator'
class PrimeEnumerator::CurriedEratosthenes < PrimeEnumerator

  def initialize
    candidate = 2
    is_prime = Proc.new { |candidate| true }

    super() do |yielder|
      loop do
        if is_prime.call(candidate)
          old_is_prime = is_prime.clone # Ruby is not happy if you try to give the Proc to itself
          old_candidate = candidate

          is_prime = Proc.new { |next_candidate| old_is_prime.clone.call(next_candidate) and (next_candidate % old_candidate != 0) }
          yielder << candidate
        end
        
        candidate += 1
      end
    end
  end

end
