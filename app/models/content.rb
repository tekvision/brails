class Content
  include Mongoid::Document
  include Mongoid::Paperclip 
  has_mongoid_attached_file :topic_content

  field :title, type: String
  field :content_body, type: String
  field :sq_no, type: Integer
  field :content_type, type: String # one of [video, audio, text, image]

  belongs_to :topic
end

