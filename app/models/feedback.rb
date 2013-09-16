class Feedback
  include Mongoid::Document
  
  field :name, type: String
  field :email, type: String
  field :content_feedback, type: String
  field :accessible_feedback, type: String
  field :other_feedback, type: String

#validation
  validates :name, :email, :presence => true
end
