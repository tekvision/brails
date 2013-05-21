# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do
    level_number '1'
    level_name 'Programming basic'
  end

  factory :topics, :parent => 'level' do
    association :level, :factory => :topic
  end

  factory :bonus_round, :parent => 'level' do
    association :level, :factory => :bonus_round 
  end
end
