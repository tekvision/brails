class Content
  include Mongoid::Document

  field :title, type: String
  field :content_body, type: String
  field :sq_no, type: Integer
  field :content_type, type: String # one of [video, audio, text, image]

  belongs_to :topic
end

