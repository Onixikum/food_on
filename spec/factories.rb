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
    name       "Cola"
    price      '8.99'
    food_type  '3'
    company_id '1'
  end

  factory :order do
    dish1_id   '1'
    dish2_id   '2'
    dish3_id   '3'
    user_id    '1'
    address    "Lviv"
    company_id '1'
  end

  factory :company do
    name 'conpany-1'
  end
end