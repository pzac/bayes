require 'spec_helper'

module Bayes
  describe LinearRegression do
    let(:data) {
      [[1,1],[2,2],[3,3]]
    }

    it 'calculates the best fit' do
      subject.data = data
      expect(subject.m).to eq(1)
      expect(subject.q).to eq(0)
    end
  end
end
