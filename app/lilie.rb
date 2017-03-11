require_relative './flower.rb'

class Lilie < Flower
  attr_accessor :name, :code, :bundle_size_and_price

  def initialize
    @name = 'Lilie'
    @code = 'L09'
    @bundle_size_and_price = [ {size: 3, price: BigDecimal.new('9.95')}, {size: 6, price: BigDecimal.new('16.95')}, {size: 9, price: BigDecimal.new('24.95')} ]
  end

end
