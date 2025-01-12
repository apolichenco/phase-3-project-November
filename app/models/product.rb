require 'pry'

class Product < ActiveRecord::Base
    belongs_to :category
    has_many :prices

  def sell_for_value
    last_priced = self.prices.last.price
    gain = last_priced * 0.3
    number = last_priced + gain
    number.round(2)
  end

  def last_priced
    self.prices.last.price
  end

  def discount discount
    discounted_off = self.sell_for * discount.to_f
    self.sell_for - discounted_off
  end

  def profit_margins
    number = self.prices.last.price * 0.3
    Math.round(number * 100.0) / 100.0
  end

  def order_date
    numbered_date = Product.first.prices.last.created_at
    date = DateTime.parse(numbered_date.to_s)
    date.strftime("%a, %d %b %Y")
  end

  def self.count
    Product.all.count
  end

  def display_price
    "The price is #{self.prices.last.price}"
  end
  
end