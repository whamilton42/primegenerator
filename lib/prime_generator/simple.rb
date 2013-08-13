require 'prime_generator'
class PrimeGenerator::Simple

	def is_prime?(number)
		return false if number == 1
		(2...number).each do |divisor|
			return false if number % divisor == 0
		end
		true
	end

end
