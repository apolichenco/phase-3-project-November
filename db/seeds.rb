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
        price: rand(1..10),
        category_id: rand(1..3)
    )
end


puts "✅ Done seeding!"
