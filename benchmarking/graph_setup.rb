require 'benchmark'
require_relative '../lib/prime_enumerator/trial_division'
require_relative '../lib/prime_enumerator/erastothenes'
require_relative '../lib/prime_enumerator/curried_erastothenes'
require_relative '../lib/prime_enumerator/lazy_erastothenes'

@enumerators = []
@enumerators << PrimeEnumerator::Erastothenes.new(upper_bound: 1_000_000)
@enumerators << PrimeEnumerator::LazyErastothenes.new
@enumerators << PrimeEnumerator::CurriedErastothenes.new
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
