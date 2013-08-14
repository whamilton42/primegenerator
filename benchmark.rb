require 'benchmark'
require_relative 'lib/prime_enumerator/simple'
require_relative 'lib/prime_enumerator/erastothenes'
require_relative 'lib/prime_enumerator/curried_erastothenes'

enumerators = []
enumerators << PrimeEnumerator::Erastothenes.new(upper_bound: 10_000)
enumerators << PrimeEnumerator::CurriedErastothenes.new
enumerators << PrimeEnumerator::Simple.new

label_width = enumerators.map { |enumerator| enumerator.to_s.length }.max + 20

Benchmark.bm(label_width) do |x|
	enumerators.each do |enumerator|
		x.report("take(10) -- #{enumerator}") { enumerator.take(10) }
	end
end

Benchmark.bm(label_width) do |x|
	enumerators.each do |enumerator|
		x.report("take(500) -- #{enumerator}") { enumerator.take(500) }
	end
end
