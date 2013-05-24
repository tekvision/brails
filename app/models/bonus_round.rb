class BonusRound
  include Mongoid::Document

  field :extra_cookies, type: Integer
  has_many :questions
end
