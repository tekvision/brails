class Request
  include Mongoid::Document

  field :title, type: String
  field :body, type: String
  field :status, type: String

  validates :title, :body, :status, :presence => true

  has_many :comments
end

