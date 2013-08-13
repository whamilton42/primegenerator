require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	UPPER_BOUND = 100

	def take(n)
		candidates = (2..UPPER_BOUND).to_a

		p = nil
		primes = []

		while prime = candidates.detect { |candidate| candidate > (p || 1) }
			p = prime
			primes << prime
			return primes if primes.length == n

			while prime < UPPER_BOUND
				prime += p
				candidates.delete_if { |candidate| candidate == prime }
			end
		end
	end

	def nth(n)
		take(n).last
	end

end
