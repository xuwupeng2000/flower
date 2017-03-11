require_relative './flower.rb'

class Tulip < Flower
  attr_accessor :name, :code, :bundle_size_and_price

  def initialize
    @name = 'Tulip'
    @code = 'T58'
    @bundle_size_and_price = [ {size: 3, price: BigDecimal.new('5.95')}, {size: 5, price: BigDecimal.new('9.95')}, {size: 9, price: BigDecimal.new('16.99')} ]
  end

end
