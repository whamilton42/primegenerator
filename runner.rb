require_relative 'lib/prime_multiplication_table_printer'
require_relative 'lib/prime_generator/simple'
require_relative 'lib/prime_generator/erastothenes'

generators = [PrimeGenerator::Erastothenes.new, PrimeGenerator::Simple.new]

generators.each do |generator|
	puts "Using #{generator} generator"

	number_of_primes = 10
	printer = PrimeMultiplicationTablePrinter.new(number_of_primes: number_of_primes, prime_number_generator: generator.method(:take))
	puts "Multiplication table of first #{number_of_primes} primes"
	printer.output(outputter: Proc.new{|output| puts output })

  [1_000, 65_000].each do |n|
  	nth_prime = generator.nth(n)
  	puts "Calculation of #{n}th prime: #{nth_prime}"
  end
end
