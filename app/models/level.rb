class Level
  include Mongoid::Document

  field :level_number, type: Integer
  field :level_name, type: String

  has_many :topics, dependent: :destroy 
  has_one :bonus_round
  has_one :bonus_cookie

  #validation
  validates :level_number, :level_name, :presence => true
  validates :level_number, :numericality => {:only_integer => true,  :greater_than => 0 }
end
