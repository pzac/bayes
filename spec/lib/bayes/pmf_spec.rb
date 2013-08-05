require 'spec_helper'

describe Bayes::PMF do
  before do
    @pmf = Bayes::PMF.new
  end

  describe "#set" do
    it "assigns a value to an item and returns the value" do
      expect(@pmf.set(:foo, 0.5)).to eq(0.5)
    end
  end

  describe "#get" do
    it "returns the probability value of an item" do
      @pmf.set(:foo, 0.5)
      expect(@pmf.get(:foo)).to eq(0.5)
    end
  end

  describe "#increment" do
    it "sets the item value to 1 if the item isn't set" do
      @pmf.increment(:foo)
      expect(@pmf.get(:foo)).to eq(1)
    end

    it "increases item value to to the specified amount" do
      @pmf.set(:foo, 1)
      @pmf.increment(:foo, 3)
      expect(@pmf.get(:foo)).to eq(4)
    end
  end

  describe "#normalize!" do
    it "normalizes all probabilities in the [0,1] range" do
      @pmf.set(:foo, 1)
      @pmf.set(:bar, 4)
      @pmf.normalize!
      expect(@pmf.normalized(:foo)).to eq(1/5.0)
      expect(@pmf.normalized(:bar)).to eq(4/5.0)
    end
  end
end
