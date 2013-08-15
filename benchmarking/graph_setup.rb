require 'benchmark'
require_relative '../lib/prime_enumerator/trial_division'
require_relative '../lib/prime_enumerator/eratosthenes'
require_relative '../lib/prime_enumerator/curried_eratosthenes'
require_relative '../lib/prime_enumerator/lazy_eratosthenes'

@builders = []
@builders << {enumerator: PrimeEnumerator::Eratosthenes, 				constructor: Proc.new { PrimeEnumerator::Eratosthenes.new(upper_bound: 1_000_000) }}
@builders << {enumerator: PrimeEnumerator::LazyEratosthenes, 		constructor: Proc.new { PrimeEnumerator::LazyEratosthenes.new }}
@builders << {enumerator: PrimeEnumerator::CurriedEratosthenes, constructor: Proc.new { PrimeEnumerator::CurriedEratosthenes.new }}
@builders << {enumerator: PrimeEnumerator::TrialDivision, 			constructor: Proc.new { PrimeEnumerator::TrialDivision.new }}

@enumerators = @builders.collect { |b| b[:enumerator] }

@ns = (1..20).collect { |num| num * 100 }

@results = {}
@builders.each do |builder|
	@results[builder[:enumerator]] = []

	@ns.each do |n|
		enumerator = builder[:constructor].call # stops Eratosthenes caching
		puts "#{enumerator.class} - #{n}"

		b = Benchmark.measure { enumerator.take(n) }
		@results[enumerator.class] << b.real
	end
end
