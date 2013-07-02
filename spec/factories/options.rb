# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option do
    label 'computer language'
    is_valid 'false'
    association :question
  end
end
