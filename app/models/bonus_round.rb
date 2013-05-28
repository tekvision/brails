class BonusRound
  include Mongoid::Document

  field :extra_cookies, type: Integer
  field :is_locked, type: Boolean

  has_many :questions
  belongs_to :level
end
