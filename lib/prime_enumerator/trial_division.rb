require_relative '../prime_enumerator'
class PrimeEnumerator::TrialDivision < PrimeEnumerator
  def initialize
    super do |yielder|
      candidate = 2
      loop do
        yielder << candidate if is_prime?(candidate)
        candidate += 1
      end
    end
  end

  private

    def is_prime?(number)
      return false if number == 1
      (2...number).each do |divisor|
        return false if number % divisor == 0
      end
      true
    end

end
