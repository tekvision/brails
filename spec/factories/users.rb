# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
   sequence(:email)      {|i | i.to_s + Faker::Internet.email}
    password 'abcd1234'
    password_confirmation 'abcd1234'
    roles "Admin"
  end
end
