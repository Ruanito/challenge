# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = []
10.times do |i|
  categories << Category.create({ name: "Category #{i}" })
end

products = []
10.times do |i|
  products << Product.create(
    {
      name: "Product #{i}",
      identifier: "PRO#{i}",
      quantity: 10, price: 1000,
      instructions: "Instruction #{i}",
      categories: categories.slice(0, rand(0..9))
    }
  )
end

states = %w[AL AK AZ AR CA NC SC CO CT ND SD DE DC FL GA HI IA ID IL IN]

20.times do |i|
  Patient.create(
    {
      full_name: "Full Name #{i}",
      email: "email#{i*i}@email.com",
      date_of_birth: Date.today,
      state: states[rand(0..19)]
    }
  )
end

20.times do |i|
  Rule.create(
    {
      state: states[rand(0..19)],
      rule_type: :NOT_OFFERED,
      product: products[rand(0..10)],
    }
  )
end

20.times do |i|
  Rule.create(
    {
      state: states[rand(0..19)],
      rule_type: :MINIMUM_AGE,
      product: products[rand(0..10)],
      minimum_age: rand(10..20),
    }
  )
end

