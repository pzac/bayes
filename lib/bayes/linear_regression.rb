module Bayes
  # Simple linear regression implementation. Given an array of [x, y] data, it
  # calculates the best linear function y = mx + q
  #
  # http://jmduke.com/posts/basic-linear-regressions-in-python/
  class LinearRegression
    include Arithmetic

    # An array of [x, y] values
    attr_accessor :data

    def initialize
      @data = []
    end

    def m
      (sum_of_products - (x_sum * y_sum) / num_items) /
      (x_sum_squared - ((x_sum ** 2) / num_items))
    end

    def q
      (y_sum - m * x_sum) / num_items
    end

    private

    def xs
      data.map{|x| x[0]}
    end

    def ys
      data.map{|x| x[1]}
    end

    def num_items
      Float(data.size)
    end

    def x_sum
      xs.inject(:+)
    end

    def y_sum
      ys.inject(:+)
    end

    def x_sum_squared
      xs.inject(0){|a, e| a + e ** 2}
    end

    def sum_of_products
      data.inject(0) do |total, pair|
        total + pair[0] * pair[1]
      end
    end

  end
end
