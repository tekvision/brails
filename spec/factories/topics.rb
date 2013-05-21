# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title "Arrays, Hash"
    cookies '3'
    summary "topic points"
  end
end
