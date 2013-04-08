class Content
  include Mongoid::Document
  field :content_body, type: String
  field :content_type, type: String

validates :content_body, :content_type, :presence => true

has_one :topic

end

