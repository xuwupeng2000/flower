require_relative '../app/bundle_price_service.rb'
Bundler.require(:default, :test, :development)

RSpec.describe BundlePriceService do

  describe "call" do

    context "when quantity and code are valid" do
      context 'for rose' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(10, Rose.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 12.99
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(5, Rose.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 6.99
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(15, Rose.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 19.98
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(3, Rose.new.code)
          expect(results).to eq 'Can not find bunlde fit this quantiy'
        end
      end

      context 'for lilie' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(15, Lilie.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 41.90
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(3, Lilie.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 9.95
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(6, Lilie.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 16.95
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(87, Lilie.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 241.5
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(7, Lilie.new.code)
          expect(results).to eq 'Can not find bunlde fit this quantiy'
        end
      end

      context 'for tulip' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(13, Tulip.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 25.85
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(12, Tulip.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 22.94
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(3, Tulip.new.code)
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 5.95
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call(1, Tulip.new.code)
          expect(results).to eq 'Can not find bunlde fit this quantiy'
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

    context 'quantity does not fit into any bundle' do
      it "should return message"  do 
        service = BundlePriceService.new
        results =  service.call(11, Tulip.new.code)
        expect(results).to eq 'Can not find bunlde fit this quantiy'
      end

      it "should return message"  do 
        service = BundlePriceService.new
        results =  service.call(1, Tulip.new.code)
        expect(results).to eq 'Can not find bunlde fit this quantiy'
      end
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
