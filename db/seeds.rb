# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Product.create([
#   { name: "Apple", price: 1.99, brand: "Fuji" },
#   { name: "Orange", price: 2.99, brand: "Navel" },
#   { name: "Banana", price: 3.99, brand: "Cavendish" },
#   { name: "Grape", price: 4.99, brand: "Concord" },
#   { name: "Strawberry", price: 5.99, brand: "Seascape" },
#   { name: "Blueberry", price: 6.99, brand: "Wild" },
#   { name: "Raspberry", price: 7.99, brand: "Red" },
# ])



require 'faker'

# Create 10 products with random names, prices, and brands
10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10..100),
    brand: Faker::Company.name
  )
end
