require 'timeout'

require_relative 'lib/prime_multiplication_table_printer'
require_relative 'lib/prime_enumerator/trial_division'
require_relative 'lib/prime_enumerator/eratosthenes'
require_relative 'lib/prime_enumerator/curried_eratosthenes'
require_relative 'lib/prime_enumerator/lazy_eratosthenes'

enumerators = []
enumerators << PrimeEnumerator::Eratosthenes.new(upper_bound: 1_000_000)
enumerators << PrimeEnumerator::CurriedEratosthenes.new
enumerators << PrimeEnumerator::TrialDivision.new
enumerators << PrimeEnumerator::LazyEratosthenes.new

enumerators.each do |enumerator|
  puts enumerator.class

  number_of_primes = 10
  printer = PrimeMultiplicationTablePrinter.new(  number_of_primes: number_of_primes, 
                                                  prime_number_enumerator: enumerator.method(:take)
                                                )
  puts "Multiplication table of first #{number_of_primes} primes"
  printer.output(outputter: Proc.new{|output| puts output })

  grace = 10
  [1_000, 65_000].each do |n|
    begin
      Timeout::timeout(grace) do
      	print "Calculation of #{n}th prime: "
        nth_prime = enumerator.nth(n)
        print nth_prime
      end
    rescue Timeout::Error
      print "took too long! (> #{grace} seconds)"
    end
    puts ""
  end
  puts ""
end
