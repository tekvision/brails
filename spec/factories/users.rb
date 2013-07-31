# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email)      {|i| i.to_s + Faker::Internet.email}
    password 'abcd1234'
    confirmed_at { Time.now }
    roles "Student"

    factory :admin do
      roles "Admin"
    end

    factory :student do
      roles "Student"
    end

    factory :contributor do
      roles "Contributor"
    end
  end
end
