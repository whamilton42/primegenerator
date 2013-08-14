require 'spec_helper'

require_relative 'enumerator_spec_helper'
include PrimeEnumerator::EnumeratorSpecHelper

require 'prime_enumerator/erastothenes'

describe PrimeEnumerator::Erastothenes do
	let(:enumerator) { PrimeEnumerator::Erastothenes.new(upper_bound: 10_000) }
	common_enumerator_specs
end
