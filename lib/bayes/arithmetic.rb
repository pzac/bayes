module Bayes
  # Collection of small useful methods
  # #
  module Arithmetic
    # Arithmetic mean of an array of numbers
    #
    # mean([1,2,3]) # => 2
    def mean(array)
      array.inject(:+) / Float(array.size)
    end
  end
end
