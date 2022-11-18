require 'pry'
require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here
Category.create(name: "meat")
Category.create(name: "pantry")
Category.create(name: "dairy")

10.times do
    Product.create(
        name: Faker::Food.ingredient,
        category_id: rand(1..3)
    )
end

50.times do 
    Price.create(
        price: rand(1..10),
        product_id: rand(1..10)
    )
end

all_products = Product.all
all_products.each do |p|
    p.update(sell_for: "#{n.sell_for}")
end 

puts "✅ Done seeding!"
