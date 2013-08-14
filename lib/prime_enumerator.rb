class PrimeEnumerator < Enumerator
  def nth(n)
    take(n).last
  end
end
