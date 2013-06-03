class BonusCookie
  include Mongoid::Document
  field :cookies, type: Integer

  belongs_to :user
  belongs_to :bonus_round
end
