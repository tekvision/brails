class BonusRound
  include Mongoid::Document

  field :extra_cookies, type: Integer

  has_many :questions
  belongs_to :level
  has_one :bonus_cookie
end
