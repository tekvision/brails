# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title "Arrays and Hash"
    description "topic points"

    association :level
  end
end
