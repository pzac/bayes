require 'spec_helper'

class MyClass
  include Bayes::Arithmetic
end

describe "Bayes::Arithmetic" do
  subject { MyClass.new }

  describe '.mean' do
    specify do
      expect(subject.mean([1,3,5])).to eq(3)
    end
  end
end
