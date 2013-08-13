require_relative '../prime_verifier'
class PrimeVerifier::Erastothenes

	def is_prime?(n)
		# [
		# 	[3, true],
		# 	[4, true],
		# ]

		# [
		# 	{num: 3, possibly_prime: true},
		# 	{num: 4, possibly_prime: true}
		# ]
		max = 100
		candidates = []
		(2..max).each do |candidate|
			candidates << {num: candidate, possibly_prime: true}
		end

		p = 1
		primes = []
		while p = candidates.detect { |candidate| candidate[:possibly_prime] and candidate[:num] > p }
			p = p[:num]
			return true if p == n
			

			(p..max).each do |multiplier|
				candidate_to_remove = candidates.detect { |candidate| candidate[:num] == (p * multiplier) }
				if candidate_to_remove
					candidate_to_remove[:possibly_prime] = false
				end
			end
		end

		return false
	end

end
