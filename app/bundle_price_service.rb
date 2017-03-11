Bundler.require(:default, :development)
require_relative './rose.rb'
require_relative './lilie.rb'
require_relative './tulip.rb'

class BundlePriceService

  def call(quantity, code)
    return 'Please enter valid quantity' unless quantity.is_a? Integer
    return 'Please enter valid flower code' unless code && ['R12', 'L09', 'T58'].include?(code)

    flower_klass = case code
                   when 'R12'
                     Rose
                   when 'L09'
                     Lilie
                   when 'T58'
                     Tulip
                   else
                     raise 'Sorry, should not ever reach there'
                   end

    flower = flower_klass.new
    results = fit_with(flower, flower.bundle_size_and_price, quantity)
    results
  end

  private

  def fit_with(flower, bundle_size_and_price, quantity)
    unbundled_quantity = quantity
    results = []

    bundle_size_and_price.sort!{|a, b| b[:size] <=> a[:size] }
    bundle_size_and_price.each do |e|
        number_of_bundle = unbundled_quantity/e[:size]
        number_of_flower = number_of_bundle * e[:size]
        
        results << {
                     bundle_size: e[:size],
                     number_of_bundle: number_of_bundle,
                     number_of_flower: number_of_bundle * e[:size],
                     price_per_bundle: e[:price],
                     price_for_this_bundle: (e[:price] * number_of_bundle),
                     flower_name: flower.name,
                     flower_code: flower.code
                   }
        unbundled_quantity = unbundled_quantity - number_of_flower
      end

    total_bundled_flowers = results.inject(0){|sum, h| sum + h[:number_of_flower]}

    if total_bundled_flowers != quantity
      bundle_size_and_price.shift # Drop the largest size then try to fit the bundle again
      if bundle_size_and_price.empty? # Reach the end
        return 'Can not find bunlde fit this quantiy' 
      else
        fit_with(flower, bundle_size_and_price, quantity)
      end
    else
      return results
    end
  end

end
