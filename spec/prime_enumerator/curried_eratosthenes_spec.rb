require 'spec_helper'

require_relative 'enumerator_spec_helper'
include PrimeEnumerator::EnumeratorSpecHelper

require 'prime_enumerator/curried_eratosthenes'

describe PrimeEnumerator::CurriedEratosthenes do
  let(:enumerator) { PrimeEnumerator::CurriedEratosthenes.new }
  common_enumerator_specs
end
