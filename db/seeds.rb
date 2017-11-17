#### Create user to manually testing
User.create!(email: "test@gmail.com", username: "Guy Fieri", password: "password")

10.times do
  User.create!(email: Faker::Internet.email,
              username: Faker::Name.unique.name,
              password: "password")
end

p "Created #{User.count} users"

40.times do
  Product.create!(name: Faker::Food.spice,
                  cost: Faker::Commerce.price,
                  country_of_origin: Faker::Address.country)
end

60.times do
  Review.create!(content_body: Faker::Hipster.paragraph,
                rating: Faker::Number.between(1,5),
                product_id: Faker::Number.between(Product.first.id, Product.last.id),
                user_id: Faker::Number.between(User.first.id, User.last.id))
end
