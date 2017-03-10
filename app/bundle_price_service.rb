Bundler.require(:default, :development)
require_relative './rose.rb'
require_relative './lilie.rb'
require_relative './tulip.rb'

class BundlePriceService

  def call(quantity, code)
    # Validate quantity is number
    # Validate code is in the list
    # Validate if the order can't fit into bundle where the result of mod is smaller than the smallest bundle size we have
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
                     raise 'Sorry'
                   end

    unbundled_quantity = quantity
    results            = []
    flower             = flower_klass.new

    flower.bundle_size_and_price
      .sort{|a, b| b[:size] <=> a[:size] }
      .each do |e|
        number_of_bundle = unbundled_quantity/e[:size]
        number_of_flower = number_of_bundle * e[:size]
        
        results << {
                     flower_name: flower.name,
                     flower_code: flower.code,
                     bundle_size: e[:size],
                     number_of_bundle: number_of_bundle,
                     number_of_flower: number_of_bundle * e[:size],
                     price_per_bundle: e[:price],
                     price_for_this_bundle: (e[:price] * number_of_bundle)
                   }
        # If it does not fit we need to try different combination
        unbundled_quantity = unbundled_quantity - number_of_flower
    end

    results # Return results

    filtered = results.select{|e| e[:number_of_bundle] != 0}
    filtered
  end

end
