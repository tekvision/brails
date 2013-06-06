# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attempt do
    count '0'
    solved 'false'
    cookies '2'

    association :user
    association :question
  end
end
