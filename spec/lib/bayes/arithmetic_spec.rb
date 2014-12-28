require 'spec_helper'

module Bayes
  module Arithmetic
    describe '.mean' do
      specify do
        expect(mean([1,3,5])).to eq(3)
      end
    end
  end
end
