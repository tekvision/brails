class StoryBoard
  include Mongoid::Document
  field :name, type: String
  field :short_name, type: String
  field :description, type: String

  validates :name, :description,  :presence => true
  has_many :stories
end
