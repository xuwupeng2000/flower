require_relative '../app/rose.rb'
Bundler.require(:default, :test, :development)

RSpec.describe Rose do
  it "should have name"  do 
    flower = Rose.new
    expect(flower.name).to eq 'Rose'
  end

  it "should have code"  do 
    flower = Rose.new
    expect(flower.code).to eq 'R12'
  end

  it "should have bundle_size_and_price" do 
    flower = Rose.new
    expect(flower.bundle_size_and_price).to eq [{:size=>5, :price=>6.99}, {:size=>10, :price=>12.99}]
  end
end
