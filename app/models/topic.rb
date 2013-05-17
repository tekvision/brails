class Topic
  include Mongoid::Document
  field :topic_number, type: Integer
  field :title, type: String
  field :sub_topic, type: Integer
  validates :topic_number, :title, :presence => true

  has_one :content
  
end

