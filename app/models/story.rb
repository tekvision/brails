class Story
  include Mongoid::Document

  field :story_number, type: Float
  field :name, type: String
  field :description, type: String

  validates :story_number, :name, :presence => true

  belongs_to :storyBoard
  has_many :topics
end