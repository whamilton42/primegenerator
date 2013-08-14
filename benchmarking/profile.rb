require 'benchmark'
require_relative '../lib/prime_enumerator/trial_division'
require_relative '../lib/prime_enumerator/eratosthenes'
require_relative '../lib/prime_enumerator/curried_eratosthenes'
require_relative '../lib/prime_enumerator/lazy_eratosthenes'

def enumerators
  enumerators = []
  enumerators << PrimeEnumerator::Eratosthenes.new(upper_bound: 1_000_000)
  enumerators << PrimeEnumerator::LazyEratosthenes.new
  enumerators << PrimeEnumerator::CurriedEratosthenes.new
  enumerators << PrimeEnumerator::TrialDivision.new
end

label_width = enumerators.map { |enumerator| enumerator.class.name.length }.max + 15

require 'timeout'
allowed_duration = 10
[10, 500, 65_000].each do |n|
	Benchmark.bm(label_width) do |x|
		enumerators.each do |enumerator|
			x.report("take(#{n}) -- #{enumerator.class}") do
				begin
					Timeout::timeout(allowed_duration) do
						enumerator.take(n)
					end
				rescue Timeout::Error
					print "took too long (> #{allowed_duration} seconds)"
				end
			end
		end
	end
end
