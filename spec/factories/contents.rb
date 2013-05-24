# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    title 'Array and hashes'
    sq_no '1'
    content_body 'AudioFile'
    association :topic
  end
end
