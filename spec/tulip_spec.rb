require_relative '../app/tulip.rb'
Bundler.require(:default, :test, :development)

RSpec.describe Tulip do
  it "should have name"  do
    flower = Tulip.new
    expect(flower.name).to eq 'Tulip'
  end

  it "should have code"  do
    flower = Tulip.new
    expect(flower.code).to eq 'T58'
  end

  it "should have bundle_size_and_price" do
    flower = Tulip.new
    expect(flower.bundle_size_and_price).to eq [ {size: 3, price: BigDecimal.new('5.95')}, {size: 5, price: BigDecimal.new('9.95')}, {size: 9, price: BigDecimal.new('16.99')} ]
  end
end
