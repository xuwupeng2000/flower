require_relative '../app/bundle_price_service.rb'
Bundler.require(:default, :test, :development)

RSpec.describe BundlePriceService do
  describe "process" do
    it "should hanlde correct input"  do 
      service = BundlePriceService.new
      results = service.call('10 R12')

      expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 12.99
    end

    it "return message for incorrect input"  do 
      service = BundlePriceService.new
      results = service.call('10R12')

      expect(results).to eq 'Please enter valid quantity and flower code eg: 10 R12'
    end

    it "return message for incorrect input"  do 
      service = BundlePriceService.new
      results = service.call('')

      expect(results).to eq 'Please enter valid quantity and flower code eg: 10 R12'
    end

    it "return message for incorrect input"  do 
      service = BundlePriceService.new
      results = service.call('10 D12')

      expect(results).to eq 'Please enter valid quantity and flower code eg: 10 R12'
    end
  end

  describe "call" do

    context "when quantity and code are valid" do
      context 'for rose' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("10 R12")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 12.99
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("5 R12")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 6.99
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("15 R12")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 19.98
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("3 R12")
          expect(results).to eq 'Can not find bunlde fit this quantiy'
        end
      end

      context 'for lilie' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("15 L09")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 41.90
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("3 L09")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 9.95
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("6 L09")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 16.95
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("87 L09")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 241.5
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("7 L09")
          expect(results).to eq 'Can not find bunlde fit this quantiy'
        end
      end

      context 'for tulip' do
        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("13 T58")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 25.85
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("12 T58")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 22.94
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("3 T58")
          expect(results.inject(0){|sum, h| sum + h[:price_for_this_bundle] }.to_f).to eq 5.95
        end

        it "should return correct result"  do 
          service = BundlePriceService.new
          results =  service.call("1 T58")
          expect(results).to eq 'Can not find bunlde fit this quantiy'
        end

      end
      
    end
  end

  describe "validation" do
    context 'quantity does not fit into any bundle' do
      it "should return message"  do 
        service = BundlePriceService.new
        results =  service.call("11 T58")
        expect(results).to eq 'Can not find bunlde fit this quantiy'
      end

      it "should return message"  do 
        service = BundlePriceService.new
        results =  service.call("1 T58")
        expect(results).to eq 'Can not find bunlde fit this quantiy'
      end
    end

    context 'code is not in the list' do
      it "should return message" do
        service = BundlePriceService.new
        results =  service.call("100 No")
        expect(results).to eq 'Please enter valid quantity and flower code eg: 10 R12'
      end
    end
  end

end
