# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :content do
    title 'Array and hashes'
    sq_no '1'
    content_body 'AudioFile'
    transcript ""
    association :topic
    topic_content {fixture_file_upload("#{Rails.root}/spec/factories/support/Sample.mp3")}
  end
end
