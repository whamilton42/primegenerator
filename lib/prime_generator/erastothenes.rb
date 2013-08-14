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
				return returned_primes(candidates: candidates, n: n) if primes.length == n

				eliminate = prime*prime
				while eliminate < UPPER_BOUND
					candidates[eliminate] = false
					eliminate += prime
				end
			end

			prime += 1
		end

		return returned_primes(candidates: candidates, n: n)
	end

	def nth(n)
		take(n).last
	end


	private

		def returned_primes(args)
			(2..UPPER_BOUND).find_all { |num| args.fetch(:candidates)[num] }[0...args.fetch(:n)]
		end

end
