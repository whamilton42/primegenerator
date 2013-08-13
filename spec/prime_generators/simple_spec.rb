require 'spec_helper'
require 'prime_generator/simple'

describe PrimeGenerator::Simple do
	let(:known_primes) { [2, 3, 29, 1801, 4357]}
	let(:not_primes) { [1, 4, 39, 1003, 6017]}
	let(:generator) { PrimeGenerator::Simple }

	describe "#is_prime?" do
		it "should return true for all known primes" do
			known_primes.each { |prime| expect(generator.is_prime?(prime)).to be_true }
		end

		it "should return false for all numbers that are not primes" do
			not_primes.each { |prime| expect(generator.is_prime?(prime)).to be_false }
		end
	end

	describe "#first_n_primes" do
		it "should return the number of primes asked for" do
			number_of_primes = 5
			expect(generator.first_n_primes(number_of_primes).length).to eql(number_of_primes)
		end

		it "should return the first 10 primes" do
			first_ten_primes = [2,3,5,7,11,13,17,19,23,29]
			expect(generator.first_n_primes(10)).to match_array(first_ten_primes)
		end
	end
end
