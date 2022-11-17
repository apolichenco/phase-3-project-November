require 'pry'

class Product < ActiveRecord::Base
    belongs_to :category

    def sell_it_for
        gain = self.price * 0.3
        self.price + gain
        binding.pry
    end
end