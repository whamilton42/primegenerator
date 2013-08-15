require 'spec_helper'
require 'prime_multiplication_table_printer'

describe PrimeMultiplicationTablePrinter do
  let(:printer_builder) { PrimeMultiplicationTablePrinter.method(:new) }
  let(:primes) { [1,2,3,999] } # the printer doesn't care they're not real primes

  it "should generate primes according to the whims of the proc" do
    printer = printer_builder.call(number_of_primes: 10, prime_number_enumerator: Proc.new{primes})
    expect(printer.primes).to eql(primes)
  end

  describe "#multiplication_table_string" do  
    it "should include all of the primes at least twice" do
      printer = printer_builder.call(number_of_primes: primes.length, prime_number_enumerator: Proc.new{primes})
      primes.each { |prime| expect(printer.multiplication_table_string.scan(prime.to_s).length).to be >= 2 }
    end

    it "should include at least one of the multiplied results we're expecting" do
      expected_multiplied_result = primes[-2] * primes[-1]
      printer = printer_builder.call(number_of_primes: primes.length, prime_number_enumerator: Proc.new{primes})
      expect(printer.multiplication_table_string.scan(expected_multiplied_result.to_s).length).to be >= 1
    end
  end
end
