require 'spec_helper'

require_relative 'enumerator_spec_helper'
include PrimeEnumerator::EnumeratorSpecHelper

require 'prime_enumerator/lazy_erastothenes'

describe PrimeEnumerator::LazyErastothenes do
	let(:enumerator) { PrimeEnumerator::LazyErastothenes.new }
	common_enumerator_specs
end
