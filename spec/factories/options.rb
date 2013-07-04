# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option do
    label 'computer language'
    is_valid 'false'
    association :question
  end

  factory :correct, :parent => 'option' do
    is_valid 'true'
  end

  factory :incorrect, :parent => 'option' do
    is_valid 'false'
  end
end
