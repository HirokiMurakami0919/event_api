FactoryBot.define do
  factory :project do
    name { "MyString" }
    place { "MyString" }
    start_at { "2025-01-08 10:42:56" }
    end_at { "2025-01-08 10:42:56" }
    deleted_at { "2025-01-08 10:42:56" }

    after(:create) do |project|
      create(:member, project: project, user: create(:user))
    end
  end
end
