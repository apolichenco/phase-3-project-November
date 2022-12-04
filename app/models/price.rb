class Price < ActiveRecord::Base
    belongs_to :product
    
    def delete_zero(product_id)
        product = Product.find(product_id)
        first_price = product.prices.first.price
        if (first_price == 0)
            product.prices.first.destroy
        end
    end

end