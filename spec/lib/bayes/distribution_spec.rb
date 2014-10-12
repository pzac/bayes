require 'spec_helper'

module Bayes
  describe Distribution do
    subject { described_class }

    describe '.poisson' do
      it 'calculates the probability of an event following the rule' do
        expect(subject.poisson(10, 4)).to be_between(0.005, 0.1)
        expect(subject.poisson(100, 4)).to be < 0.05
        expect(subject.poisson(4, 4)).to be_between(0.15, 0.25)
      end
    end

    describe '.factorial' do
      it 'calculates the right values' do
        expect(subject.factorial(0)).to eq(1)
        expect(subject.factorial(1)).to eq(1)
        expect(subject.factorial(5)).to eq(120)
      end
    end
  end
end
