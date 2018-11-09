# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[{ first_name: 'Test', last_name: 'User', email: 'test@example.com', password: 'password' }].each do |user_detail|
  User.where(email: user_detail[:email]).first_or_create do |user|
    user.first_name = user_detail[:first_name]
    user.last_name = user_detail[:last_name]
    user.email = user_detail[:email]
    user.password = user_detail[:password]
    user.password_confirmation = user_detail[:password]
  end
end
