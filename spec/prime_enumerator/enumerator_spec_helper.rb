require 'prime_enumerator'
module PrimeEnumerator::EnumeratorSpecHelper

  def common_enumerator_specs
    let(:first_set_of_primes) { [2,3,5,7,11,13,17,19,23,29] }
    let(:not_primes) { [1,4,39,1003,6017] }

    describe "#take" do
      it "should return the first set of primes" do
        expect(enumerator.take(first_set_of_primes.length)).to match_array(first_set_of_primes)
      end
    end

    describe "#nth" do
      it "should return the last of the known primes" do
        expect(enumerator.nth(first_set_of_primes.length)).to eql(first_set_of_primes.last)
      end
    end
  end

end
