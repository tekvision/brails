class BonusCookie
  include Mongoid::Document
  field :cookies, type: Integer
  field :is_locked, type: Boolean, default: true

  belongs_to :user
  belongs_to :level
  belongs_to :bonus_round
end
