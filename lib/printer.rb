class Printer
	attr_reader :number_of_primes, :primes

	def initialize(args)
		@number_of_primes = args.fetch(:number_of_primes)
		@primes = args.fetch(:prime_number_generator).call(@number_of_primes)
	end

	def multiplication_table_string
		string = "\t"
		@primes.each do |prime|
			string << "#{prime}\t"
		end
		string << "\n"
		@primes.each do |prime|
			string << "#{prime}\t"
			@primes.each do |other_prime|
				string << "#{prime * other_prime}\t"
			end
			string << "\n"
		end
		string
	end

end
