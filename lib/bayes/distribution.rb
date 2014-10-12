module Bayes
  class Distribution
    # Poisson distribution:
    # Chance of having k events given the average. If on the average 4 people
    # are attacked by sharks every year, then what is the chance to have 10
    # people eaten in a year?
    #
    # Bayes.poisson(10, 4)
    # # =>
    #
    # https://en.wikipedia.org/wiki/Poisson_distribution
    #
    def self.poisson(k, avg)
      (avg.to_f ** k) / factorial(k) * (Math::E ** -avg)
    end

    # Would you believe this isn't a standard library function?
    #
    def self.factorial(n)
      f = 1
      for i in 1..n
        f *= i
      end
      f
    end
  end
end
