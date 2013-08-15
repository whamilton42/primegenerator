require 'spec_helper'

require_relative 'enumerator_spec_helper'
include PrimeEnumerator::EnumeratorSpecHelper

require 'prime_enumerator/lazy_eratosthenes'

describe PrimeEnumerator::LazyEratosthenes do
  let(:enumerator) { PrimeEnumerator::LazyEratosthenes.new }
  common_enumerator_specs
end
