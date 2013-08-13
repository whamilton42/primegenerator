require_relative '../prime_generator'
class PrimeGenerator::Simple
	class << self
		def is_prime?(number)
			return false if number == 1
			(2...number).each do |divisor|
				return false if number % divisor == 0
			end
			true
		end

		def first_n_primes(n)
			primes = []
			candidate = 1
			while primes.length < n
				primes << candidate if is_prime?(candidate)
				candidate += 1
			end
			primes
		end

		def nth_prime(n)
			first_n_primes(n).last
		end
	end
end
