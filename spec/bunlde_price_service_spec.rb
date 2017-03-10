require_relative '../app/bundle_price_service.rb'
Bundler.require(:default, :test, :development)

RSpec.describe BundlePriceService do

  describe "call" do

    context "when quantity and code are valid" do
      context 'for rose' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(10, Rose.new.code)
          expect(results).to eq [{:flower_name=>"Rose", :flower_code=>"R12", :bundle_size=>10, :number_of_bundle=>1, :number_of_flower=>10, :price_per_bundle=>12.99, :price_for_this_bundle=>12.99}]
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }).to eq 12.99
        end
      end

      context 'for lilie' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(15, Lilie.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }).to eq 41.90
        end
      end

      context 'for tulip' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(13, Tulip.new.code)
          expect(results).to eq []
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }).to eq 25.85
        end
      end
      
    end
  end

  describe "validation" do
    context 'quantity is not number' do
      it "should return message"  do 
        service = BundlePriceService.new
        results =  service.call(nil, Lilie.new.code)
        expect(results).to eq 'Please enter valid quantity'
      end
    end

    context 'quantity does not fit into bundle' do
      # Validate if the order can't fit into bundle where the result of mod is smaller than the smallest bundle size we have
      
    end

    context 'code is not in the list' do
      it "should return message" do
        service = BundlePriceService.new
        results =  service.call(100, 'Not in the list')
        expect(results).to eq 'Please enter valid flower code'
      end
    end
  end

end
