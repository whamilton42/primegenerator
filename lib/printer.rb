class Printer
	attr_reader :number_of_primes, :primes

	def initialize(args)
		@number_of_primes = args.fetch(:number_of_primes)
		@primes = args.fetch(:prime_number_generator).call(@number_of_primes)
	end

end
