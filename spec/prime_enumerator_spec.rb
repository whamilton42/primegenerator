require 'spec_helper'
require 'prime_enumerator'

describe PrimeEnumerator do
	let(:first_set_of_primes) { [2,3,5,7,11,13,17,19,23,29] }
	let(:not_primes) { [1, 4, 39, 1003, 6017]}
	# let(:enumerator) { PrimeEnumerator.new(prime_verifier: Proc.new{true}) }

	describe "#take" do
		it "should obey the proc and return everything" do
			enumerator = PrimeEnumerator.new(prime_verifier: Proc.new{true})
			expect(enumerator.take(5)).to match_array([2,3,4,5,6])
		end
	end

	describe "#nth" do
		it "should return the last of the take" do
			enumerator = PrimeEnumerator.new(prime_verifier: Proc.new{true})
			expect(enumerator.nth(5)).to eql(enumerator.take(5).last)
		end
	end

end
