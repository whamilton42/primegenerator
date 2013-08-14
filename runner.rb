require_relative 'lib/prime_multiplication_table_printer'
require_relative 'lib/prime_enumerator/simple'
require_relative 'lib/prime_enumerator/erastothenes'

enumerators = [PrimeEnumerator::Erastothenes.new(upper_bound: 1_000_000), PrimeEnumerator::Simple.new]

enumerators.each do |enumerator|
	puts "Using #{enumerator} enumerator"

	number_of_primes = 10
	printer = PrimeMultiplicationTablePrinter.new(number_of_primes: number_of_primes, prime_number_enumerator: enumerator.method(:take))
	puts "Multiplication table of first #{number_of_primes} primes"
	printer.output(outputter: Proc.new{|output| puts output })

  [1_000, 65_000].each do |n|
  	nth_prime = enumerator.nth(n)
  	puts "Calculation of #{n}th prime: #{nth_prime}"
  end
end
