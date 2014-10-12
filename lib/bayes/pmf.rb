module Bayes
  # Generic items container. Allows adding a collection of items with an
  # associated value. The value should usually be the number of occurrences.
  #
  #   dice = Bayes::PMF.new
  #   1.upto(6){|n| dice.set(n, 1)}
  #
  #   dict = Bayes::PMF.new
  #   words = File.read(x).split(' ')
  #   words.each{|w| dict.increment(word, 1)}
  #
  # Values aren't normalized. That can be done explictly with `normalize!`
  #
  #   dict.normalize!
  #
  class PMF
    # Returns an empty PMF object with no values
    #
    def initialize
      @items = {}
      @normalized = false
    end

    # Sets the value for an item
    #
    #   my_pmf.set(:head, 0.5)
    #
    # Returns the freshly-set value
    def set(item, value)
      @items[item] ||= {:value => nil}
      @items[item][:value] = value
      @normalized = false
      value
    end

    # Gets the value for an item
    #
    #   my_pmf.get(:head)
    #
    # Returns the item value or `nil` if not set
    def get(item)
      if values = @items[item]
        values[:value]
      end
    end

    # Gets the normalized value of an item
    #
    #   my_pmf.normalized(:head)
    #
    # Returns the item value or `nil` if not set
    def normalized(item)
      normalize! unless @normalized
      if values = @items[item]
        values[:normalized]
      end
    end

    # Increases the value of an item. Useful with dictionaries:
    #
    #   my_pmf.increment('word', 1)
    #
    def increment(item, amount = 1)
      @items[item] ||= {:value => 0}
      @normalized = false
      @items[item][:value] += amount
    end

    # Calculates the normalized value ([0, 1])for all items. Original values
    # are preserved. If new items are added, the method should be called again
    #
    def normalize!
      total_items = @items.size
      raise "No items set" if total_items == 0
      total_sum = @items.values.map{|x| x[:value] }.inject(:+).to_f

      @items.each_pair do |key, values|
        @items[key][:normalized] = values[:value] / total_sum
      end
      @normalized = true
    end

    # Returns a key-value hash of all item values
    def values_hash
      hashify(:value)
    end

    # Returns a key-value hash of all item normalized values
    def normalized_hash
      normalize! unless @normalized
      hashify(:normalized)
    end

    # Returns true if the set values have been normalized
    def normalized?
      !!@normalized
    end

    private

    # Returns a key-value hash for all objects using the attribute as value
    def hashify(attribute)
      out = {}
      @items.each_pair do |key, value|
        out[key] = value[attribute]
      end
      out
    end
  end
end
