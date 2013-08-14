require_relative '../prime_enumerator'
class PrimeEnumerator::Erastothenes < PrimeEnumerator
  attr_reader :upper_bound, :candidates, :prime

  def initialize(args)
    @upper_bound = args.fetch(:upper_bound)
    @candidates = (0..@upper_bound).collect { |num| true }
    @prime = 2

    super() do |yielder|
      loop do

        while @prime*prime <= @upper_bound
          if @candidates[@prime]
            yielder << @prime

            eliminate = @prime*@prime
            if eliminate > @upper_bound
              raise StopIteration
            else
              while eliminate < @upper_bound
                @candidates[eliminate] = false
                eliminate += @prime
              end
            end
          end

          @prime += 1
        end

        raise StopIteration
      end
    end
  end

end
