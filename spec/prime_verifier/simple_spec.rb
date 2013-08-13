require 'spec_helper'
require 'prime_verifier/simple'

describe PrimeVerifier::Simple do
	let(:first_set_of_primes) { [2,3,5,7,11,13,17,19,23,29] }
	let(:not_primes) { [1, 4, 39, 1003, 6017]}
	let(:generator) { PrimeVerifier::Simple.new }

	describe "#is_prime?" do
		it "should return true for all known primes" do
			first_set_of_primes.each { |prime| expect(generator.is_prime?(prime)).to be_true }
		end

		it "should return false for all numbers that are not primes" do
			not_primes.each { |prime| expect(generator.is_prime?(prime)).to be_false }
		end
	end
end
