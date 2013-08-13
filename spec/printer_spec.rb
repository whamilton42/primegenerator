require 'spec_helper'
require 'printer'

describe Printer do
	it "should generate primes according to the whims of the proc" do
		primes = 'primes'
		printer = Printer.new(number_of_primes: 10, prime_number_generator: Proc.new{primes})
		expect(printer.primes).to eql(primes)
	end

	describe "#multiplication_table_string" do	
		it "should include all of the primes at least twice" do
			primes = [1,2,3,999]
			printer = Printer.new(number_of_primes: 10, prime_number_generator: Proc.new{primes})
			primes.each { |prime| expect(printer.multiplication_table_string.scan(prime.to_s).length).to be >= 2 }
		end

		it "should include at least one of the multiplied results we're expecting" do
			primes = [1,2,3,999]
			expected_multiplied_result = primes[-2] * primes[-1]
			printer = Printer.new(number_of_primes: 10, prime_number_generator: Proc.new{primes})
			expect(printer.multiplication_table_string.scan(expected_multiplied_result.to_s).length).to be >= 1
		end
	end
end
