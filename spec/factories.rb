FactoryGirl.define do
  factory :user do
    sequence(:name)       { |n| "User #{n}" }
    sequence(:email)      { |n| "user_#{n}@mail.com" }
    password              "xxxxxx"
    password_confirmation "xxxxxx"

    factory :admin do
      admin true
    end
  end
end