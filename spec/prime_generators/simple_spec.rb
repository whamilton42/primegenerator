require 'spec_helper'
require 'prime_generator/simple'

describe PrimeGenerator::Simple do
	let(:first_set_of_primes) { [2,3,5,7,11,13,17,19,23,29] }
	let(:not_primes) { [1, 4, 39, 1003, 6017]}
	let(:generator) { PrimeGenerator::Simple }

	describe "#is_prime?" do
		it "should return true for all known primes" do
			first_set_of_primes.each { |prime| expect(generator.is_prime?(prime)).to be_true }
		end

		it "should return false for all numbers that are not primes" do
			not_primes.each { |prime| expect(generator.is_prime?(prime)).to be_false }
		end
	end

	describe "#first_n_primes" do
		it "should return the first set of primes" do
			expect(generator.first_n_primes(first_set_of_primes.length)).to match_array(first_set_of_primes)
		end
	end

	describe "#nth_prime" do
		it "should return the last of the known primes if asked for" do
			expect(generator.nth_prime(first_set_of_primes.length)).to eql(first_set_of_primes.last)
		end
	end
end
