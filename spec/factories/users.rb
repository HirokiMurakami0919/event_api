FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    tel { "MyString" }
    role { 1 }
    password_digest { "MyString" }
    last_sign_in_at { "2025-01-08 07:18:13" }
  end
end
