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

		primes = (2..UPPER_BOUND).find_all { |num| candidates[num] }[0...n]
		if primes.length == n
			primes
		else
			raise "An upper-limit of #{UPPER_BOUND} is not sufficient to find #{n} primes. Only found #{primes.length}."
		end
	end

	def nth(n)
		take(n).last
	end

end
