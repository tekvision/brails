# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bonus_cookie, :class => 'BonusCookie' do
    cookies "3"
    association :user
    association :bonus_round
  end
end
