require 'spec_helper'
require 'prime_generator/simple'

describe PrimeGenerator::Simple do
	let(:known_primes) { [2, 3, 29, 1801, 4357]}
	let(:not_primes) { [1, 4, 39, 1003, 6017]}
	let(:generator) { PrimeGenerator::Simple.new }

	describe "#is_prime?" do
		it "should return true for all known primes" do
			known_primes.each { |prime| expect(generator.is_prime?(prime)).to be_true }
		end

		it "should return false for all numbers that are not primes" do
			not_primes.each { |prime| expect(generator.is_prime?(prime)).to be_false }
		end
	end
end
