class Question
  include Mongoid::Document

  field :sq_no, type: Integer
  field :query, type: String
  field :cookies_count, type: Integer
  field :attempts_count type: Integer
  field :is_attempted, type: Boolean
  has_many :options
  belongs_to :topic
  belongs_to :bonus_round
end
