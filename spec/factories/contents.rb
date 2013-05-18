# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    title 'Array and hashes'
    type 'Audio'
    sq_no '1'
    body_content 'AudioFile'
  end
end
