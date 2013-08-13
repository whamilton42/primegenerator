require_relative '../prime_generator'
class PrimeGenerator::Simple < Enumerator
	def initialize
		super do |yielder|
			candidate = 2
			loop do
				yielder << candidate if self.class.is_prime?(candidate)
				candidate += 1
			end
		end
	end

	class << self
		def is_prime?(number)
			return false if number == 1
			(2...number).each do |divisor|
				return false if number % divisor == 0
			end
			true
		end

		def first_n_primes(n)
			new.take(n)
		end

		def nth_prime(n)
			first_n_primes(n).last
		end
	end
end
