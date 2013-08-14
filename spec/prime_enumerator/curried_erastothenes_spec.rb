require 'spec_helper'

require_relative 'enumerator_spec_helper'
include PrimeEnumerator::EnumeratorSpecHelper

require 'prime_enumerator/curried_erastothenes'

describe PrimeEnumerator::CurriedErastothenes do
	let(:enumerator) { PrimeEnumerator::CurriedErastothenes.new }
	common_enumerator_specs
end
