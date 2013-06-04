# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    title 'Array and hashes'
    sq_no '1'
    content_body 'AudioFile'
    content_type "text"
    association :topic
  end

  factory :audio_file, :parent => "content" do
    content_type "audio"
    topic_content { fixture_file_upload 'audio/mp3' }
  end
  
  factory :vidio_file, :parent => "content" do
    content_type "vidio"
    topic_content { fixture_file_upload 'vidio/mp4' }
  end

  factory :image_file, :parent => "content" do
    content_type "image"
    topic_content { fixture_file_upload 'image/jpg', 'image/jpeg', 'image/png' }
  end
end
