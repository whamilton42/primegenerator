require 'spec_helper'

require_relative 'enumerator_spec_helper'
include PrimeEnumerator::EnumeratorSpecHelper

require 'prime_enumerator/eratosthenes'

describe PrimeEnumerator::Eratosthenes do
  let(:enumerator) { PrimeEnumerator::Eratosthenes.new(upper_bound: 1_000_000) }
  common_enumerator_specs

  it "should return a super-high prime" do
    expect(enumerator.nth(65_000)).to eq(814_279)
  end
end
