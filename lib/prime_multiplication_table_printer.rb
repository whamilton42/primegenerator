class PrimeMultiplicationTablePrinter
	attr_reader :number_of_primes, :primes, :multiplication_table_string

	def initialize(args)
		@number_of_primes = args.fetch(:number_of_primes)
		@primes = args.fetch(:prime_number_enumerator).call(@number_of_primes)
		@multiplication_table_string = generate_multiplication_table_string
	end

	def output(args)
		args.fetch(:outputter).call(@multiplication_table_string)
	end


	private

		def generate_multiplication_table_string
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
