require 'benchmark'
require_relative '../lib/prime_enumerator/trial_division'
require_relative '../lib/prime_enumerator/eratosthenes'
require_relative '../lib/prime_enumerator/curried_eratosthenes'
require_relative '../lib/prime_enumerator/lazy_eratosthenes'

@enumerators = []
@enumerators << PrimeEnumerator::Eratosthenes.new
@enumerators << PrimeEnumerator::LazyEratosthenes.new
@enumerators << PrimeEnumerator::CurriedEratosthenes.new
@enumerators << PrimeEnumerator::TrialDivision.new

@ns = (1..20).collect { |num| num * 100 }

@results = {}
@enumerators.each do |enumerator|
	@results[enumerator.class] = []

	@ns.each do |n|
		puts "#{enumerator.class} - #{n}"
		enumerator = enumerator.class.new # stops Eratosthenes caching

		b = Benchmark.measure { enumerator.take(n) }
		@results[enumerator.class] << b.real
	end
end
