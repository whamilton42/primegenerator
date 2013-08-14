require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	attr_reader :upper_bound
	def initialize(args)
		@upper_bound = args.fetch(:upper_bound)
	end

	def take(n)
		candidates = (0..@upper_bound).collect { |num| true }

		prime = 2
		primes = []

		while prime*prime <= @upper_bound
			if candidates[prime]
				primes << prime
				return primes if primes.length == n

				eliminate = prime*prime
				while eliminate < @upper_bound
					candidates[eliminate] = false
					eliminate += prime
				end
			end

			prime += 1
		end

		primes = (2..@upper_bound).find_all { |num| candidates[num] }[0...n]
		if primes.length == n
			primes
		else
			raise "An upper-limit of #{@upper_bound} is not sufficient to find #{n} primes. Only found #{primes.length}."
		end
	end

	def nth(n)
		take(n).last
	end

end
