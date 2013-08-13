require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	UPPER_BOUND = 100

	def take(n)
		# [
		# 	{num: 3, possibly_prime: true},
		# 	{num: 4, possibly_prime: true}
		# ]
		candidates = (2..UPPER_BOUND).each_with_object([]) do |candidate, candidates|
			candidates << candidate
		end

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
