require_relative '../prime_generator'
class PrimeGenerator::Erastothenes
	UPPER_BOUND = 100

	def take(n)
		# [
		# 	{num: 3, possibly_prime: true},
		# 	{num: 4, possibly_prime: true}
		# ]
		candidates = (2..UPPER_BOUND).each_with_object([]) do |candidate, candidates|
			candidates << {num: candidate, possibly_prime: true}
		end

		prime = nil
		primes = []

		while candidate = candidates.detect { |candidate| candidate[:possibly_prime] and candidate[:num] > (prime || 1) }
			prime = candidate[:num]
			primes << prime
			return primes if primes.length == n

			(prime..UPPER_BOUND).each do |multiplier|
				candidate_to_remove = candidates.detect { |candidate| candidate[:num] == (prime * multiplier) }
				if candidate_to_remove
					candidate_to_remove[:possibly_prime] = false
				end
			end
		end
	end

	def nth(n)
		take(n).last
	end

end
