require_relative 'lib/prime_multiplication_table_printer'
require_relative 'lib/prime_generator/simple'

generators = [PrimeGenerator::Simple]

generators.each do |generator|
	puts "Using #{generator} generator"

	number_of_primes = 10
	printer = PrimeMultiplicationTablePrinter.new(number_of_primes: number_of_primes, prime_number_generator: generator.method(:first_n_primes))
	puts "Multiplication table of first #{number_of_primes} primes"
	printer.output(outputter: Proc.new{|output| puts output })

	n = 1000
	nth_prime = generator.nth_prime(n)
	puts "Calculation of #{n}th prime: #{nth_prime}"
end
