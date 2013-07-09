module Bayes
  class PMF
    # Returns an empty PMF object with no values
    #
    def initialize
      @items = {}
    end

    # Sets the probability for an item
    #
    #   my_pmf.set(:head, 0.5)
    #
    def set(item, probability)
      @items[item] ||= probability
    end

    # Gets the probability for an item
    #
    #   my_pmf.get(:head)
    #
    def get(item)
      @items[item]
    end
    alias_method :probability, :get

    # Increases the value of an item. Useful with dictionaries:
    #
    #   my_pmf.increment('word', 1)
    #
    def increment(item, amount = 1)
      @items[item] ||= 0
      @items[item] += amount
    end

    # Normalizes the items probabilities so that all values are [0, 1]
    #
    def normalize!
      total_items = @items.size
      raise "No items set" if total_items == 0
      total_sum = @items.values.inject(:+).to_f
      @items.each_pair do |k, v|
        @items[k] = v / total_sum
      end
    end
  end
end
