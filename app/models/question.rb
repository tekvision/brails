class Question
  include Mongoid::Document

  field :sq_no, type: Integer
  field :query, type: String
  field :cookies, type: Integer

  has_many :options
  belongs_to :topic
  belongs_to :bonus_round
  has_one :attempt
end
