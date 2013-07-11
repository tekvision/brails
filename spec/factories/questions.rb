# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    sq_no '2'
    query 'What is Ruby?'
    question_type "Hard"
    association :bonus_round
    association :content
    after(:build) do |question| 
      FactoryGirl.create(:correct, :question => question)
      2.times {|i| FactoryGirl.create(:incorrect, :question => question)}
    end
  end
end
