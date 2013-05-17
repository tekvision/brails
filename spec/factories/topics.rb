# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    topic_name "Arrays, Hash"
    cookies '3'
    subtopic_name "Multilevel array"
    topic_summary "topic points"
  end

  factory :questions, :parent => 'topic' do
    association :topic, :factory => :questions     
  end

  factory :content, :parent => 'topic' do
    association :topic, :factory => :contents     
  end
end
