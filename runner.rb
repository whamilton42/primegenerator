require_relative 'lib/printer'
require_relative 'lib/prime_generator/simple'

number_of_primes = 10
printer = Printer.new(number_of_primes: number_of_primes, prime_number_generator: PrimeGenerator::Simple.method(:first_n_primes))
puts "Multiplication table of first #{number_of_primes} using a very simple generation method"
printer.output(outputter: Proc.new{|output| puts output })
