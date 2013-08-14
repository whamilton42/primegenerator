require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	UPPER_BOUND = 100

	def take(n)
		candidates = (2..UPPER_BOUND).to_a

		prime = 1
		p = nil
		primes = []

		while prime = candidates.detect { |candidate| candidate > (prime || 1) }
			p = prime
			primes << prime
			return primes if primes.length == n

			p *= p
			while p < UPPER_BOUND
				candidates.delete(p)
				p += prime
			end
		end
	end

	def nth(n)
		take(n).last
	end

end
