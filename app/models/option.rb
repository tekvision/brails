class Option
  include Mongoid::Document

  field :label, type: String
  field :is_valid, type: Boolean

  belongs_to :question

  #validations
  validates :question_id, :label, :presence => true 

  validate :validate_options

  def validate_options
    self.errors.add(:base,  "Atleast one option should be valid") if question.options.collect(&:is_valid).count(true) == 0
    self.errors.add(:base, "Multiple options can't be valid") if question.options.collect(&:is_valid).count(true) > 1 
  end

end
