require 'benchmark'
require_relative 'lib/prime_generator/simple'
require_relative 'lib/prime_generator/erastothenes'

generators = [PrimeGenerator::Simple, PrimeGenerator::Erastothenes]

Benchmark.bm(3) do |x|
	generators.each do |generator|
		x.report("take(10) -- #{generator}") { generator.new.take(10) }
	end
end

Benchmark.bm(3) do |x|
	generators.each do |generator|
		x.report("take(500) -- #{generator}") { generator.new.take(500) }
	end
end
