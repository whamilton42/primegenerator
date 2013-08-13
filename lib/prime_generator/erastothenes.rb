require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	UPPER_BOUND = 100

	def take(n)
		candidates = (2..UPPER_BOUND).to_a

		prime = nil
		primes = []

		while prime = candidates.detect { |candidate| candidate > (prime || 1) }
			primes << prime
			return primes if primes.length == n

			(prime..UPPER_BOUND).each do |multiplier|
				candidates.delete_if { |candidate| candidate == (prime * multiplier) }
			end
		end
	end

	def nth(n)
		take(n).last
	end

end
