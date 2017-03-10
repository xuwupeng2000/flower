class Rose
  attr_accessor :name, :code, :bundle_size_and_price

  def initialize
    @name = 'Rose'
    @code = 'R12'
    @bundle_size_and_price = [ {size: 5, price: 6.99}, {size: 10, price: 12.99} ]
  end

end
