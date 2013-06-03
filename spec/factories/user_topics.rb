# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_topic do
    is_completed "false"
    topic_cookies "4"
    association :user
    association :topic
  end
end
