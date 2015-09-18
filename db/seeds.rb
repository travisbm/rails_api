# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  user = User.create({
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    age:        Faker::Number.number(2)
  })
  Address.create({
    user_id: user.id,
    street_name: Faker::Address.street_name,
    city:        Faker::Address.city,
    state:       Faker::Address.state,
    zip:         Faker::Address.zip
  })
end

25.times do
  Item.create({
    name:        Faker::Commerce.product_name,
    price:       Faker::Commerce.price,
    description: Faker::Commerce.department
    })
end

100.times do
  Order.create({
    item_id:   Faker::Number.between(1, Item.count),
    user_id:   Faker::Number.between(1, User.count),
    quantity:  Faker::Number.between(1, 5)
    })
end
