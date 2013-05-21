# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    sq_number '2'
    q_content 'What is Ruby?'
    cookies_count '2'
    attempts_count '3'
    is_attempted 'true'
    option
  end
end
