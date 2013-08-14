require_relative '../prime_enumerator'
class PrimeEnumerator::LazyErastothenes < PrimeEnumerator

  def initialize
    candidate = 2
    composite_enumerators = []

    super() do |yielder|
      loop do
        prime = true

        composite_enumerators.each do |enumerator|
          comparison = enumerator.peek
          if comparison == candidate
            enumerator.next
            prime = false
          end
        end

        if prime
          composite_enumerators << CompositeEnumerator.new(start_number: candidate)        
          yielder << candidate
        end

        candidate += 1
      end
    end
  end

end


class CompositeEnumerator < Enumerator
  attr_reader :start_number, :composite
  def initialize(args)
    @start_number = args.fetch(:start_number)
    @composite = @start_number * @start_number

    super() do |yielder|
      loop do
        yielder << @composite
        @composite += start_number
      end
    end
  end
end
