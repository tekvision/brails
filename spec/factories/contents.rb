# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    title 'Array and hashes'
    sq_no '1'
    content_body 'AudioFile'
    transcript ""
    association :topic
  end

  factory :audio_file, :parent => "content" do
    topic_content_file_name {'programming_basic.mp3'}
    topic_content_content_type { 'audio/mp3' }
    topic_content_file_size { 1024}
  end
  
  factory :vidio_file, :parent => "content" do
    topic_content_file_name {'programming_basic.mp4'}
    topic_content_content_type { 'video/mp4' }
    topic_content_file_size { 1024}
  end

  factory :image_file, :parent => "content" do
    topic_content_file_name {'erd.jpg'}
    topic_content_content_type { 'image/jpg'}
    topic_content_file_size { 1024}
  end
end
