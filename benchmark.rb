require 'benchmark'
require_relative 'lib/prime_enumerator/trial_division'
require_relative 'lib/prime_enumerator/erastothenes'
require_relative 'lib/prime_enumerator/curried_erastothenes'
require_relative 'lib/prime_enumerator/lazy_erastothenes'

def enumerators
  enumerators = []
  enumerators << PrimeEnumerator::Erastothenes.new(upper_bound: 1_000_000)
  enumerators << PrimeEnumerator::LazyErastothenes.new
  enumerators << PrimeEnumerator::CurriedErastothenes.new
  enumerators << PrimeEnumerator::TrialDivision.new
end

label_width = enumerators.map { |enumerator| enumerator.to_s.length }.max + 20

n = 10
Benchmark.bm(label_width) do |x|
	enumerators.each do |enumerator|
		x.report("take(#{n}) -- #{enumerator}") { enumerator.take(n) }
	end
end

n = 500
Benchmark.bm(label_width) do |x|
	enumerators.each do |enumerator|
		x.report("take(#{n}) -- #{enumerator}") { enumerator.take(n) }
	end
end

n = 65_000
Benchmark.bm(label_width) do |x|
  enumerators.each do |enumerator|
    x.report("take(#{n}) -- #{enumerator}") { enumerator.take(n) }
  end
end
