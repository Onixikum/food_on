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

  factory :product do
    name "Cola"
    price '8.99'
    food_type '3'
  end
end