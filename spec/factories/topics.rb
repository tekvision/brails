# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title "Arrays and Hash"
    description "topic points"
    _slugs ["Arrays and Hash"]

    association :level
  end
end
