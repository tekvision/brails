class Option
  include Mongoid::Document

  field :label, type: String
  field :value, type: String
  field :is_valid, type: Boolean

  #validations
  validates :value, :question_id, :presence => true 

  belongs_to :question
end
