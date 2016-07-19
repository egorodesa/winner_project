# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
150.times do |b|
  User.create!(first_name:"egor#{b}", last_name:"od#{b}", address:"my_address#{b}",
              email: "email#{b}@mail.com", password:"12345678#{b}")
end



# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
