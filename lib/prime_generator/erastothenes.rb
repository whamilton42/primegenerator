require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	UPPER_BOUND = 100

	def take(n)
		range = (0..UPPER_BOUND)
		candidates = range.collect { |num| true }

		prime = 2
		p = nil
		primes = []

		while prime < UPPER_BOUND
			return returned_primes(candidates: candidates, n: n) if prime*prime > UPPER_BOUND

			if candidates[prime]
				p = prime
				primes << prime
				return returned_primes(candidates: candidates, n: n) if primes.length == n

				p *= p
				while p < UPPER_BOUND
					candidates[p] = false
					p += prime
				end
			end

			prime += 1
		end
	end

	def nth(n)
		take(n).last
	end


	private

		def returned_primes(args)
			(2..UPPER_BOUND).find_all { |num| args.fetch(:candidates)[num] }[0...args.fetch(:n)]
		end

end
