require 'spec_helper'

describe Bayes::Table do
  describe '#to_s' do
    it 'renders a simple table' do
      data = {:foo => 1, :bar => 2}
      output = described_class.new(data).to_s

      expect(output).to eq("foo\t1\nbar\t2\n")
    end
  end
end
