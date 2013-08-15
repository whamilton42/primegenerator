require 'spec_helper'

require_relative 'enumerator_spec_helper'
include PrimeEnumerator::EnumeratorSpecHelper

require 'prime_enumerator/trial_division'

describe PrimeEnumerator::TrialDivision do
  let(:enumerator) { PrimeEnumerator::TrialDivision.new }
  common_enumerator_specs
end
