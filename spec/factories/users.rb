# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    tel { '123-456-7890' }
    role { 0 }
    last_sign_in_at { Time.now }
  end
end
