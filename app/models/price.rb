class Price < ActiveRecord::Base
    belongs_to :product
    
    def sell_for
        gain = self.price * 0.3
        self.update(sell_for: self.price + gain)
    end



end