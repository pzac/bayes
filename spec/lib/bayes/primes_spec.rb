require 'spec_helper'

module Bayes::Primes
  describe '.upto' do
    xit 'returns the prime numbers up to (and including) n' do
      expect(Bayes::Primes.upto(20)).to eq([2,3,5,7,9,11,13])
    end
  end

  describe '.is_prime' do
    it do
      expect(Bayes::Primes.is_prime(3)).to be
      expect(Bayes::Primes.is_prime(13)).to be
      expect(Bayes::Primes.is_prime(23)).to be
      expect(Bayes::Primes.is_prime(24)).to_not be
      expect(Bayes::Primes.is_prime(240)).to_not be
    end
  end
end
