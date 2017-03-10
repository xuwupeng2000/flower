class Tulip
  attr_accessor :name, :code, :bundle_size_and_price

  def initialize
    @name = 'Tulip'
    @code = 'T58'
    @bundle_size_and_price = [ {size: 3, price: 9.95}, {size: 5, price: 9.95}, {size: 9, price: 16.99} ]
  end

end
