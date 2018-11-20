# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do |n|
    user = User.create!({name: Faker::FunnyName.name, email: Faker::Internet.email , password: 'asd123!',
      password_confirmation: "asd123!", gender: 1, school:'bach khoa', school_year:3},)
    user.save
    rate = Review.create({user_id: user.id, company_id: 1, rating: Faker::Number.within(1..5)})
  end