require 'pry'

class Product < ActiveRecord::Base
    belongs_to :category
    has_many :prices
    attr_reader :sell_for

  def sell_for
    gain = self.prices.last.price * 0.3
    @sell_for = self.prices.last.price + gain
  end

  def discount discount
    discounted_off = self.sell_for * discount.to_f
    self.sell_for - discounted_off
  end

  def profit_margins
    self.prices.last.price * 0.3
  end

  def order_date
    numbered_date = Product.first.prices.last.created_at
    t= DateTime.parse(numbered_date.to_s)
  end
  
end