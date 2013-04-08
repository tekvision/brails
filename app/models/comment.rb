class Comment
  include Mongoid::Document
  field :description, type: String

  validates :description, :presence => true

  belongs_to :request

end

