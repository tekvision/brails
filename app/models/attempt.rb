class Attempt
  include Mongoid::Document

  field :increase_count, type: Integer, default: 0
  field :solved, type: Boolean, default: false
  field :cookies, type: Integer, default: 0

  belongs_to :user
  belongs_to :question
  belongs_to :topic
end
