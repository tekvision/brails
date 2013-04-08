class Chapter
  include Mongoid::Document
  field :chapter_number, type: Integer
  field :name, type: String
  field :description, type: String
  validates :chapter_number, :name, :presence => true
  belongs_to :part
  has_many :topics
end

