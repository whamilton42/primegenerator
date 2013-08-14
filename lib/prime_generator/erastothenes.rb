require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	UPPER_BOUND = 10_000

	def take(n)
		candidates = (0..UPPER_BOUND).collect { |num| true }

		prime = 2
		primes = []

		while prime*prime <= UPPER_BOUND
			if candidates[prime]
				primes << prime
				return primes if primes.length == n

				eliminate = prime*prime
				while eliminate < UPPER_BOUND
					candidates[eliminate] = false
					eliminate += prime
				end
			end

			prime += 1
		end

		return (2..UPPER_BOUND).find_all { |num| candidates[num] }[0...n]
	end

	def nth(n)
		take(n).last
	end

end
