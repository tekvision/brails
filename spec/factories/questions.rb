# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    sq_no '2'
    query 'What is Ruby?'
    cookies '2'
    association :bonus_round
    association :topic
  end
end
