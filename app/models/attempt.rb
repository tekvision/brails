class Attempt
  include Mongoid::Document

  field :increase_count, type: Integer, default: 0
  field :solved, type: Boolean, default: false
  field :coins, type: Integer, default: 0

  belongs_to :user
  belongs_to :question
  belongs_to :topic

  validates :coins, :increase_count, :numericality =>true
end
