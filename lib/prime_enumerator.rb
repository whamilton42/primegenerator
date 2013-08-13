class PrimeEnumerator < Enumerator
	attr_reader :prime_verifier

  def initialize(args)
  	@prime_verifier = args.fetch(:prime_verifier)

    super() do |yielder|
      candidate = 2

      loop do
      	yielder << candidate if @prime_verifier.call(candidate)
      	candidate += 1
      end
    end
  end

  def nth(n)
  	take(n).last
  end

end
