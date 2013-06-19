class BonusRound
  include Mongoid::Document

  attr_accessible :level_id, :questions_attributes

  has_many :questions
  belongs_to :level
  accepts_nested_attributes_for :questions, allow_destroy: true
end
