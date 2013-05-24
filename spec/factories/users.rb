# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
   sequence(:email)      {|i | i.to_s + Faker::Internet.email}
    password 'abcd1234'
    password_confirmation 'abcd1234'
    roles "Student"
  end

  factory :admin, :parent => 'user' do
    roles "Admin"
  end

  factory :student, :parent => 'user' do
    roles "Student"
  end

  factory :contributor, :parent => 'user' do
    roles "Contributor"
  end
end
