require 'benchmark'
require_relative '../lib/prime_enumerator/trial_division'
require_relative '../lib/prime_enumerator/eratosthenes'
require_relative '../lib/prime_enumerator/curried_eratosthenes'
require_relative '../lib/prime_enumerator/lazy_eratosthenes'

@enumerators = []
@enumerators << PrimeEnumerator::Eratosthenes.new(upper_bound: 1_000_000)
@enumerators << PrimeEnumerator::LazyEratosthenes.new
@enumerators << PrimeEnumerator::CurriedEratosthenes.new
@enumerators << PrimeEnumerator::TrialDivision.new

@ns = (1..20).collect { |num| num * 100 }

@results = {}
@enumerators.each do |enumerator|
	@results[enumerator.class] = []

	@ns.each do |n|
		puts "#{enumerator.class} - #{n}"
		if upper_bound = enumerator.instance_variable_get("@upper_bound")
			enumerator = enumerator.class.new(upper_bound: upper_bound)
		else
			enumerator = enumerator.class.new
		end

		b = Benchmark.measure { enumerator.take(n) }
		@results[enumerator.class] << b.real
	end
end
