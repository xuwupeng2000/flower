require_relative '../app/lilie.rb'
Bundler.require(:default, :test, :development)

RSpec.describe Lilie do
  it "should have name"  do
    flower = Lilie.new
    expect(flower.name).to eq 'Lilie'
  end

  it "should have code"  do
    flower = Lilie.new
    expect(flower.code).to eq 'L09'
  end

  it "should have bundle_size_and_price" do
    flower = Lilie.new
    expect(flower.bundle_size_and_price).to eq [ {size: 3, price: BigDecimal.new('9.95')}, {size: 6, price: BigDecimal.new('16.95')}, {size: 9, price: BigDecimal.new('24.95')} ]
  end
end
