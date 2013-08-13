require 'spec_helper'
require 'printer'

describe Printer do
	it "should generate primes according to the whims of the proc" do
		primes = 'primes'
		printer = Printer.new(number_of_primes: 10, prime_number_generator: Proc.new{primes})
		expect(printer.primes).to eql(primes)
	end
end
