module Bayes
  # Simple ascii table generator
  #
  #   data = {:a => 123, :b => 456}
  #   puts Bayes::Table.new(data)
  #
  class Table
    def initialize(data)
      @data = data
    end

    # Returns the ascii representation
    #
    def to_s
      out = ''
      @data.each_pair do |key, value|
        out += "#{key}\t#{value}\n"
      end
      out
    end
  end
end
