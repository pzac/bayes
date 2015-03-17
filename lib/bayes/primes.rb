module Bayes
  module Primes
    # Returns all prime numbers from 2 to n using the sieve of Eratosthenes
    def self.upto(n)
    end

    # Returns true if the number is prime
    #
    def self.is_prime(n)
      return true if n == 2

      i = 2
      while i <= Math.sqrt(n)
        return false if n % i == 0
        i += 1
      end
      true
    end
  end
end
