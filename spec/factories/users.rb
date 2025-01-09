# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { 'test@example.com' }
    password { 'password' }
    tel { '123-456-7890' }
    role { 0 }
  end
end
