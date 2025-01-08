# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    tel: Faker::PhoneNumber.cell_phone,
    role: rand(0..2),
    password: 'password'
  )
end

3.times do
  Project.create!(
    name: Faker::Lorem.sentence,
    place: Faker::Address.city,
    start_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
    end_at: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    user_id: User.all.sample.id
  )
end
